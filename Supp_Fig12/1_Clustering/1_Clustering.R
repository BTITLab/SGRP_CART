rm(list = ls())

library(tidyverse)
library(flowCore)
library(flowWorkspace)
library(CATALYST)
library(RColorBrewer)


prevData <- "../0_Quality_control_cleaning/rds"
data_folder <- "../data"

plotDir <- "plots"
rdsDir <- "rds"

myPalette <-  c('#e6194b', '#4363d8', '#3cb44b', '#f58231', '#ffe119', '#000000', '#CD00CD', '#aaffc3', '#98BFDB', '#e6beff', '#9a6324', '#fffac8', '#808080', '#000075', '#bcf60c')

sce <- readRDS(file.path(prevData, "sce_pre_gated.rds"))
assay(sce, "exprs") <- counts(sce)

## select features to keep
features1 <- type_markers(sce)


## Cell population identification with FlowSOM and ConsensusClusterPlus
set.seed(1234)

sce <- cluster(sce, features = features1,
               xdim = 10, ydim = 10, maxK = 22, seed = 1234)

saveRDS(sce, file.path(rdsDir, "sce_meta22.rds"))
# sce <- readRDS(file.path(rdsDir, "sce_meta22.rds"))

delta_area(sce)

## Heatmap of the median marker intensities
ch22 <- plotExprHeatmap(sce, features = "type", by="cluster_id", k="meta22",
                        row_anno = T, perc = T, bars = T, row_clust = T,
                        scale = "last", col_clust = F, k_pal = myPalette) 
ch22

## Distributions of marker intensities
ce22 <- plotClusterExprs(sce, k = "meta22", features = features1) 
x<-rev(ComplexHeatmap::row_order(ComplexHeatmap::draw(ch22)))
levels_ch22 <- c(levels(ce22$data$cluster_id)[match(x, gsub(" .*","",levels(ce22$data$cluster_id)))], "average")
levels(ce22$data$cluster_id) <- levels_ch22
ce22


## Visual representation with UMAP and t-SNE

# runing TSNE and UMAP on markers used for clustering
set.seed(1234)
sce <- runDR(sce, dr = "TSNE", cells = 500, features = "type")
sce <- runDR(sce, dr = "UMAP", cells = 1e3, features = "type")

saveRDS(sce, file.path(rdsDir, "sce_maxK22_TSNE_UMAP_TypeFeatures.rds"))

plotDR(sce, "TSNE", color_by = "meta12", k_pal = myPalette)


