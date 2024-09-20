# Description of code - 3_Differential_Analysis

## Initialization:

-   Clear the current R environment.
-   Load necessary libraries (`tidyverse`, `ComplexHeatmap`, `diffcyt`, `CATALYST`).
-   Set directories for previous data, data folder, and plots.

## Palette and Levels Setup:

-   Define color palettes and levels for merging clusters.

## Load Data:

-   Load the metadata from the `metadata.csv` file.
-   Load the previously processed SingleCellExperiment (SCE) object from an RDS file.

## Preprocess Data:

-   Remove cells belonging to the "unknown" and "debris" clusters from the SCE object.
-   Drop unused levels from the `merging` factor in the SCE object.

## Create Design and Contrast Matrix:

-   Extract experimental information from the metadata of the SCE object.
-   Create a design matrix for differential analysis based on the `condition` column.
-   Create a contrast matrix for comparing conditions.

## Test for Differential abundance (DA) of clusters:

-   Perform differential abundance analysis using the `diffcyt` package.
-   Convert the DA results into a data frame (tb_res_DA) using topTable with formatted values.
-   Extract the row data from the DA results into a table (tbl_DA).
-   Extract results from the differential abundance analysis, filtering for significant results (logFC \> 0.5, p_adj \< 0.05).

## Generate Heatmap for the results:

-   Generate a heatmap of differential abundance per population, applying significance cutoffs (FDR = 0.05, logFC = 0.5).
-   Draw the heatmap with a custom color palette and save it as a PDF file.
