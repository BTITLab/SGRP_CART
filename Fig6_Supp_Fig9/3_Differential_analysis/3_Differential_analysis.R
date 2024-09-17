rm(list = ls())

library(tidyverse)
library(ComplexHeatmap)
library(diffcyt)
library(CATALYST)



prevData <- "../2_Annotation/rds"

data_folder <- "../data"

plotDir <- "plots"

## palette and levels
# Merging
levels.merging <- c("homeostatic MG", "activated MG", "CD11c-hi MG", "MoMac", "MoDC", "pDC", "Neutrophils", "unknown")
pal.merging <-  c('#66C2EE', '#F3C58F', '#D93A32', '#96C355', '#436638', '#9a6324', '#2626eb', '#D3D3D3')
names(pal.merging) <- levels.merging

# Conditions
levels.condition <- c("EGFRvIII CAR",  "EGFRvIII-SGRP CAR")
pal.condition <- c("#008FD5", "#0054A6")
names(pal.condition) <- levels.condition

my_scale_fill <- scale_fill_manual(breaks = levels.condition, values=pal.condition)
my_scale_col <- scale_color_manual(breaks = levels.condition, values=pal.condition)

## load data
metadata <- read.csv(file.path(data_folder, "metadata.csv"))
sce <- readRDS(file.path(prevData, "sce1_maxK22_ManualMerging.rds"))

# remove unknown cluster
sce1 <- sce
sce1$merging <- cluster_ids(sce1, k="merging")
sce1 <- sce1[, sce1$merging != "unknown"]
sce1$merging <- droplevels(sce1$merging)

## create design & contrast matrix
ei <- metadata(sce1)$experiment_info

design <- createDesignMatrix(ei, cols_design = c("condition"))
contrast <- createContrast(c(0, 1))


## Test for differential marker expression within clusters
clust.mark <- type_markers(sce1)[-c(10:15)]
m.to.test.DS <- !names(marker_classes(sce1)) %in% clust.mark
names(marker_classes(sce1))[!names(marker_classes(sce1)) %in% clust.mark]

res_DS <- diffcyt(sce1, 
                  clustering_to_use = "merging",
                  markers_to_test= m.to.test.DS,
                  transform=F,
                  analysis_type = "DS", 
                  method_DS = "diffcyt-DS-limma",
                  design = design, 
                  contrast = contrast, 
                  verbose = FALSE)

tb_res_DS <- as.data.frame(topTable(res_DS, format_vals = T, all=T, show_logFC=T))%>% filter(!is.na(logFC))

tb_res_DS.slct <- tb_res_DS%>%
  filter(logFC>abs(0.5), p_adj<0.05)

tbl_DS <- rowData(res_DS$res)

# Aggregated marker expression per sample
b2 <- plotDiffHeatmap(sce1, tbl_DS[tbl_DS$marker_id!="CD4",], fdr = 0.05, lfc=abs(0.5),
                      sort_by = "padj", col_anno = "condition", lfc_pal = c("#AD85B7","white","#5B4A98"))
hm1 <- draw(b2, column_title="aggregated marker expressions by sample \nsignificance cutoffs: FDR=0.05, logFC=0.5")
hm1

pdf("plots/Fig6g_Aggregated_marker_expression_per_sample.pdf", width = 10)
hm1
dev.off()

## CAR T cell (mCherry) phagocytosis
hm2 <- plotDiffHeatmap(sce1["Tcells", ], tbl_DS, all = TRUE, col_anno = "condition", lfc=0.5)
hm2

pdf("plots/Supp_Fig9e_mCherry_phagocytosis.pdf", height=6, width=8)
hm2
dev.off()


## TSNE mTagBFP2 expression
tsne <- plotDR(sce1, color_by = c("mTagBFP2"), 
               facet_by = "condition")

tsne

pdf("plots/Fig6h_TSNE_mTagBFP2_expression.pdf")
tsne
dev.off()
