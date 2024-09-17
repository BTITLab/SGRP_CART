rm(list = ls())

library(tidyverse)
library(flowCore)
library(flowWorkspace)
library(CATALYST)
# library(cowplot)
library(RColorBrewer)


prevData <- "../0_Quality_control_cleaning/rds"

QC_FCS <- "../0_Quality_control_cleaning/plots/PeacoQC_results/fcs_files"

data_folder <- "../data"

plotDir <- "plots"
rdsDir <- "rds"

myPalette <-  c('#e6194b', '#4363d8', '#3cb44b', '#f58231', '#ffe119', '#000000', '#CD00CD', '#aaffc3', '#98BFDB', '#e6beff', '#9a6324', '#fffac8', '#808080', '#000075', '#bcf60c')

my_scale_fill <- scale_fill_manual(breaks = c("EGFRvIII CAR",  "EGFRvIII-SGRP CAR"), values=c("#008FD5", "#0054A6"))

my_scale_col <- scale_color_manual(breaks = c("EGFRvIII CAR",  "EGFRvIII-SGRP CAR"), values=c("#008FD5", "#0054A6"))


fcs.gated.cleaned.files <- list.files(QC_FCS, pattern = '.fcs', full = T)

## Load CLEANED fcs files
fs.cleaned <- read.flowSet(fcs.gated.cleaned.files, transformation = FALSE, truncate_max_range = FALSE)

## create metadata table
filenames <- as.character(pData(fs.cleaned)$name)
sample_id <- gsub("CD45_pregated_export_.. ", "", gsub("_CD45+.fcs", "", filenames, fixed = T))
condition <- ifelse(gsub("_[0-9].*", "", sample_id) == "E", "EGFRvIII CAR", "EGFRvIII-SGRP CAR")
condition <- factor(condition, levels = c("EGFRvIII CAR", "EGFRvIII-SGRP CAR"))
patient_id <- factor(gsub("^.*_", "", sample_id))

md <- data.frame(file_name=filenames, sample_id, condition, patient_id, stringsAsFactors = FALSE)

## load panel
panel <- read.csv(file.path(data_folder, "panel.csv"))


## Construct SingleCellExperiment 
# bug in the function, not recognizing all the channels https://github.com/HelenaLC/CATALYST/issues/103

for (x in 1:length(fs.cleaned)) {
  keyword(fs.cleaned[[x]])[["$CYT"]] <- "FACS"
}

features.keep <- names(markernames(fs.cleaned))[!grepl("SC-|Time|AF|Zombie",  names(markernames(fs.cleaned)))]

sce1 <- prepData(fs.cleaned, panel, md, features = features.keep,
                 transform = FALSE,
                 panel_cols = list(channel = "fcs_colname", 
                                   antigen = "antigen", 
                                   class ="marker_class"),
                 md_cols = list(file = "file_name", 
                                id = "sample_id", 
                                factors = c("condition","patient_id")))

saveRDS(sce1, file.path(rdsDir, "sce_pre_gated_CD45_cleaned.rds"))

assay(sce1, "exprs") <- counts(sce1)

## select features to keep
features1 <- type_markers(sce1)[-c(10:15)]


## Cell population identification with FlowSOM and ConsensusClusterPlus
set.seed(1234)

sce1 <- cluster(sce1, features = features1,
                xdim = 10, ydim = 10, maxK = 22, seed = 1234)

saveRDS(sce1, file.path(rdsDir, "sce1_maxK22.rds"))

delta_area(sce1)

## Heatmap of the median marker intensities
ch22 <- plotExprHeatmap(sce1, features = "type", by="cluster_id", k="meta22",
                        row_anno = T, perc = T, bars = T, row_clust = T,
                        scale = "last", col_clust = F, k_pal = myPalette)
ch22

## Distributions of marker intensities
ce22 <- plotClusterExprs(sce1, k = "meta22", features = c(type_markers(sce1), "mTagBFP2"))
x<-rev(ComplexHeatmap::row_order(ComplexHeatmap::draw(ch22)))
levels_ch22 <- c(levels(ce22$data$cluster_id)[match(x, gsub(" .*","",levels(ce22$data$cluster_id)))], "average")
levels(ce22$data$cluster_id) <- levels_ch22
ce22


## Visual representation with UMAP and t-SNE

# runing TSNE and UMAP on markers used for clustering
set.seed(1234)
sce1 <- runDR(sce1, dr = "TSNE", cells = 500, features = features1)
sce1 <- runDR(sce1, dr = "UMAP", cells = 1e3, features = features1)

saveRDS(sce1, file.path(rdsDir, "sce1_maxK22_TSNE_UMAP_only_markers_used_for_clust.rds"))

p5 <- plotDR(sce1, "TSNE", color_by = "meta22") +                              
  theme(legend.position = "none")                                           
p5


