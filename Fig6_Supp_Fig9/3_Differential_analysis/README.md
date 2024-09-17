# Description of code - 3_Differential_Analysis

## Initialization:

-   Clear the current R environment.
-   Load necessary libraries (`tidyverse`, `ComplexHeatmap`, `diffcyt`, `CATALYST`).
-   Set directories for previous data, data folder, and plots.

## Palette and Levels Setup:

-   Define color palettes and levels for merging clusters and conditions.
-   Set up manual color scales for plots based on the defined palettes.

## Load Data:

-   Load the metadata from the `metadata.csv` file.
-   Load the previously processed SingleCellExperiment (SCE) object from an RDS file.

## Preprocess Data:

-   Remove cells belonging to the "unknown" cluster from the SCE object.
-   Drop unused levels from the `merging` factor in the SCE object.

## Create Design and Contrast Matrix:

-   Extract experimental information from the metadata of the SCE object.
-   Create a design matrix for differential analysis based on the `condition` column.
-   Create a contrast matrix for comparing conditions.

## Test for Differential Marker Expression Within Clusters:

-   Identify markers that are not used for clustering (`clust.mark`).
-   Perform differential expression analysis using the `diffcyt` package, focusing on the markers to be tested and using the `merging` clustering.
-   Extract results from the differential expression analysis, filtering for significant results (logFC \> 0.5, p_adj \< 0.05).

## Aggregated Marker Expression Heatmap:

-   Generate a heatmap of aggregated marker expression per sample, excluding the `CD4` marker and applying significance cutoffs (FDR = 0.05, logFC = 0.5).
-   Draw the heatmap with a custom color palette and save it as a PDF file.

## CAR T Cell (mCherry) Phagocytosis Analysis:

-   Generate a heatmap for the expression of markers in the "Tcells" population, annotated by condition.
-   Save the heatmap as a PDF file.

## t-SNE Plot of mTagBFP2 Expression:

-   Create a t-SNE plot to visualize `mTagBFP2` expression, faceted by condition.
-   Save the t-SNE plot as a PDF file.
