# Description of code - 2_Annotation

## Initialization:

-   Clear the current R environment.
-   Load necessary libraries (`CATALYST`, `ggplot2`, `tidyverse`).
-   Set directories for previous data, data folder, plots, and RDS output.

## Palette and Levels Setup:

-   Define color palettes and levels for merging clusters and conditions.
-   Set up manual color scales for plots based on the defined palettes.

## Load SingleCellExperiment (SCE) Object:

-   Load the previously processed SCE object from an RDS file.

## Merge Clusters:

-   Read the merging table from an Excel file, specifying how clusters should be merged.
-   Apply the manual merging of clusters to the SCE object using the merging table.
-   Save the updated SCE object with the merged clusters to an RDS file.

## Visualize t-SNE After Merging:

-   Create a t-SNE plot colored by the merged clusters.
-   Create a second t-SNE plot, faceted by `condition`, with customized legend and theme.
-   Save the faceted t-SNE plot as a PDF file.

## Heatmap and Marker Intensities Distribution:

-   Select specific features (markers) to include in the analysis.
-   Generate a heatmap of marker expression by cluster, incorporating the merged clusters.
-   Save the heatmap as a PDF file.
-   Create a plot showing the distribution of marker intensities across the merged clusters.
-   Save this plot as a PDF file.

## Pseudobulk Expression Boxplot:

-   Create a boxplot of pseudobulk expression for the `mTagBFP2` marker, grouped by cluster and colored by `condition`.
-   Apply the previously defined custom color scale.
-   Save the boxplot as a PDF file.

## Relative Population Abundances:

-   Plot the relative abundances of populations across samples, grouped by `condition`.
-   Save the relative abundance plot as a PDF file.
