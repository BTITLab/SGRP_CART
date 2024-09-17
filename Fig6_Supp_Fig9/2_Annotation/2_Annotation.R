rm(list = ls())

library(CATALYST)
library(ggplot2)
library(tidyverse)

prevData <- "../1_Clustering/rds"

data_folder <- "../data"

plotDir <- "plots"
rdsDir <- "rds"

## palette and levels
# Merging
levels.merging <- c("homeostatic MG", "activated MG", "CD11c-hi MG", "MoMac", "MoDC", "pDC", "Neutrophils", "unknown")
pal.merging <-  c('#66C2EE', '#F3C58F', '#D93A32', '#96C355', '#436638', '#9a6324', '#3265d1', '#D3D3D3')
names(pal.merging) <- levels.merging


# conditions
levels.condition <- c("EGFRvIII CAR",  "EGFRvIII-SGRP CAR")
pal.condition <- c("#008FD5", "#0054A6")
names(pal.condition) <- levels.condition

my_scale_fill <- scale_fill_manual(breaks = levels.condition, values=pal.condition)
my_scale_col <- scale_color_manual(breaks = levels.condition, values=pal.condition)

## load SCE from previous analysis
sce1 <- readRDS(file.path(prevData, "sce1_maxK22_TSNE_UMAP_only_markers_used_for_clust.rds"))


## Merge clusters

merging_table <- readxl::read_excel(file.path(prevData, "meta22_merging_table.xlsx"))
merging_table$merging <- factor(merging_table$merging, levels = levels.merging)
mt1 <- merging_table%>%
  select(original_cluster, merging)

# apply manual merging                                                   
sce1 <- mergeClusters(sce1, k = "meta22",
                      table = mt1, id = "merging")

saveRDS(sce1, "rds/sce1_maxK22_ManualMerging.rds")

## Visualise t-SNE after merging
tsne <- plotDR(sce1, "TSNE", color_by = "merging", k_pal = pal.merging)

tsne.condition <- plotDR(sce1, "TSNE", color_by = "merging", 
                         k_pal = pal.merging)+
  facet_wrap("condition", ncol=2) +          
  guides(color = guide_legend(nrow =  2, override.aes = list(size = 3))) +
  theme(legend.position="bottom")

tsne
tsne.condition

pdf("plots/Fig6f_TSNE_Merged_cluster_per_treatment.pdf", width = 10, height=10)
tsne.condition
dev.off()

## Heatmap and marker intensities distribution with new clustering
features1 <- type_markers(sce1)[-c(10:15)]

hm1 <- plotExprHeatmap(sce1, features = features1, by=c("cluster_id"), k="meta22", m="merging",
                       scale = "last", bars = T, perc = T,
                       row_clust = T, col_clust = T,
                       k_pal = pals::glasbey(), m_pal = pal.merging)
hm1

pdf("plots/Supp_Fig9b_ClusterDefining_marker_expression_and_merging.pdf", width=13)
hm1
dev.off()

ce <- plotClusterExprs(sce1, k = "merging", features = c(type_markers(sce1), "mTagBFP2")) 
ce

pdf("plots/Supp_Fig9c_Expression_of_markers_per_merged_cluster.pdf", height = 10, width = 10)
ce
dev.off()


## Pseudobulk expression boxplot for mTagBFP2
p1 <- plotPbExprs(sce1, k = "merging", features = "mTagBFP2", 
                   group_by = "cluster_id", color_by = "condition", ncol = 4)+
  my_scale_col
p1


pdf("plots/Fig6i_mTagBFP2_phagocytosis_by_immune_cell_type.pdf", height = 7, width = 13)
p1
dev.off()

## Relative population abundances
p2 <- plotAbundances(sce1, k = "merging", by = "sample_id", group_by = "condition",
                      k_pal = pal.merging)
p2

pdf("plots/Supp_Fig9d_Relative_pop_freq.pdf", height=6, width = 8)
p2
dev.off()