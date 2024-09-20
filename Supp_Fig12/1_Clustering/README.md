# Description of code - 1_Clustering

## Initialization:

-   Clear the current R environment. Load necessary libraries (`tidyverse`, `flowCore`, `flowWorkspace`, `CATALYST`, `RColorBrewer`).
-   Set directories for previous data, data folder, plots, and RDS output.

## Color Palette Setup:

-   Define custom color palettes for plots.

## Load the previous SCE object:

-   Load previously generated SCE object "sce_pre_gated.rds" as `sce`
-   Assign expression data to the `exprs` assay in `sce`.
-   Select specific features to keep for further analysis.

## Cell Population Identification:

-   Set a random seed for reproducibility.
-   Perform clustering on the `SingleCellExperiment` object using FlowSOM and ConsensusClusterPlus with the selected features.
-   Save the updated `SingleCellExperiment` object with clustering results.

## Visualization of Marker Intensities:

-   Plot a heatmap of median marker intensities by cluster using the specified color palette.
-   Plot the distributions of marker intensities across clusters.

## Dimensionality Reduction:

-   Perform t-SNE and UMAP on the markers used for clustering.
-   Save the updated `SingleCellExperiment` object with dimensionality reduction results.

## Plotting:

-   Generate and display a t-SNE plot colored by the clustering results.
