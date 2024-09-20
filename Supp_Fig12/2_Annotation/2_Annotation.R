rm(list = ls())

library(CATALYST)
library(ggplot2)
library(tidyverse)

prevData <- "../1_Clustering/rds"

data_folder <- "../data"

plotDir <- "plots"
rdsDir <- "rds"

## palette and levels
myPalette <-  c('#e6194b', '#4363d8', '#3cb44b', '#f58231', '#ffe119', '#9a6324', '#AAFF00', '#808080', '#e6beff', '#000000', '#98BFDB', '#000075', '#aaffc3', '#fffac8', '#CD00CD')

## load SCE from previous analysis
sce1 <- readRDS(file.path(prevData, "sce_maxK22_TSNE_UMAP_TypeFeatures.rds"))


## Merge clusters

cluster.codes <- unique(dplyr::select(sce1@metadata$cluster_codes, meta12))

merging_table <- data.frame(
  original_cluster = seq_along(1:length(cluster.codes$meta12)),
  new_cluster = c("Neutrophils", "unknown", "cDC1", "unknown", "homeostatic Microglia", "debris", "Border-associated Macrophages", "homeostatic Microglia", "CD11c.hi Microglia", "cDC2", "activated Microglia", "Monocytes"))
merging_table$new_cluster <- factor(merging_table$new_cluster) # clusters as factor
write.csv(merging_table, file.path(rdsDir, "merging_table.csv"))

# apply manual merging                                                   
sce1 <- mergeClusters(sce1, k = "meta12",
                      table = merging_table, id = "merging", overwrite = TRUE)
saveRDS(sce1, file.path(rdsDir,"sce1_maxK22_ManualMerging.rds"))

## Visualise t-SNE after merging
tsne <- plotDR(sce1, "TSNE", color_by = "merging", k_pal = myPalette)

tsne.condition <- plotDR(sce1, "TSNE", color_by = "merging", 
                         k_pal = myPalette)+
  facet_wrap("condition", ncol=1) +          
  guides(color = guide_legend(ncol = 2, override.aes = list(size = 3))) 

tsne
tsne.condition

pdf("plots/Supp_Fig12f_TSNE_Merged_cluster_per_treatment.pdf", width = 10, height=10)
tsne.condition
dev.off()

## Heatmap and marker intensities distribution with new clustering
hm1 <- plotExprHeatmap(sce1, features = "type", by=c("cluster_id"), k="merging",
                       scale = "last", bars = T, perc = T,
                       row_clust = F, col_clust = F,
                       k_pal = myPalette)
hm1

pdf("plots/Supp_Fig12e_ClusterDefining_marker_expression_and_merging.pdf", width=13)
hm1
dev.off()

