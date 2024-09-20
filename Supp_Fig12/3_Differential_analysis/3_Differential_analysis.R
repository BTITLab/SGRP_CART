rm(list = ls())

library(tidyverse)
library(ComplexHeatmap)
library(diffcyt)
library(CATALYST)



prevData <- "../2_Annotation/rds"

data_folder <- "../data"

plotDir <- "plots"

## palette and levels
myPalette <-  c('#e6194b', '#4363d8', '#3cb44b', '#f58231', '#ffe119', '#9a6324', '#AAFF00', '#808080', '#e6beff', '#000000', '#98BFDB', '#000075', '#aaffc3', '#fffac8', '#CD00CD')

## load data
metadata <- read.csv(file.path(data_folder, "metadata.csv"))
sce <- readRDS(file.path(prevData, "sce1_maxK22_ManualMerging.rds"))

# remove unknown cluster
sce1 <- sce
sce1$merging <- cluster_ids(sce1, k="merging")

sce1 <- sce1[, sce1$merging != "unknown" & sce1$merging != "debris"]

sce1$merging <- droplevels(sce1$merging)

metadata(sce1)$experiment_info$sample_id <- gsub(".*[ABCDEF][0-9]....", "", metadata(sce1)$experiment_info$sample_id)
sce1$sample_id <- gsub(".*[ABCDEF][0-9]....", "",sce1$sample_id)

table(sce1$sample_id, sce1$merging)
table(sce1$condition, sce1$merging)

## create design & contrast matrix
ei <- metadata(sce1)$experiment_info

design <- createDesignMatrix(ei, cols_design = c("condition"))
contrast <- createContrast(c(0, 1))

## Test for differential abundance (DA) of clusters
res_DA <- diffcyt(sce1, 
                  clustering_to_use = "merging",
                  analysis_type = "DA", 
                  method_DA = "diffcyt-DA-edgeR",
                  transform=F,
                  design = design, 
                  contrast = contrast, 
                  verbose = FALSE,
                  min_cells = 10)

tb_res_DA <- as.data.frame(topTable(res_DA, format_vals = TRUE, all=T))

topTable(res_DA, format_vals = TRUE)

tbl_DA <- rowData(res_DA$res)

hm <- plotDiffHeatmap(sce1, tbl_DA, all = TRUE, fdr = 0.05, lfc=0.5,
                      col_anno = names(colData(sce1))[c(1:2)], lfc_pal = c("#489E58","white","#68559C"))

hm

pdf(file.path(plotDir, "Supp_Fig12g_Differential_abundance_per_treatment.pdf"), height = 3, width=12)
hm
dev.off()
