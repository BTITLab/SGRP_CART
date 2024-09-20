# Description of code - 0_Quality_control_cleaning

## Initialization:

-   Clear the current R environment.
-   Load necessary libraries (`flowWorkspace`, `PeacoQC`, `flowVS`, `ggplot2`, `ggcyto`, `tidyverse`, `cowplot`).
-   Set the working directory, data directory, and output directories (`rdsDir`, `plotDir`).

## Load Data:

-   Read the `panel.csv` files.
-   List `.fcs` files in the `CD45_gated` directory.
-   Create and save metadata table.
-   Check if the files in `metadata` match the `.fcs` files and vice versa.

## Create FlowSet:

-   Create a flowSet object `fs` by reading the `.fcs` files listed in `metadata`.
-   Remove the `full_file_name` column from `metadata`.
-   Save the flowSet object `fs` as an RDS file.

## Data Transformation:

-   Select features to keep from the `panel` data, excluding specific patterns (`SC-`, `Zombie`, `AF`).
-   Identify features for transformation, further excluding `"FJComp-BUV661-A"`.
-   Compute transformation cofactors with `estParamFlowVS()` and save the list.
-   Determine best cofactor for `"FJComp-BUV661-A"` and plot results.
-   Add manually determined cofactor=900 for `"FJComp-BFP-A"` to the list of cofactors.
-   Save the updated list of cofactors.
-   After visual check, adjust cofactor for other channels in `cofactor3`.
-   Transform the flowSet using `transFlowVS()` function and visualize the transformation for the `FJComp-BFP-A` channel.
-   Save the transformed flowSet as an RDS file.

## Data Visualization:

-   Generate density plots for multiple transformed channels to visualize the transformations.

## Quality Control:

-   For each sample in the transformed flowSet, apply the PeacoQC quality control method.
-   Save the QC results and rename output files for consistency.

## Generate QC Heatmap:

-   Set the working directory to the QC results folder.
-   Generate a heatmap of the QC results and save it as a PDF.

## Report Generation:

-   Extract GUIDs from the transformed flowSet and combine with `metadata`.
-   Read the QC report, join it with `metadata`, and save the combined report as a CSV file.

## Create SCE object:

-   Load the cleaned FCS files after QC into a new flowSet.
-   Fix a bug in the FCS files by modifying the $CYT keyword in each file.
-   Create a SingleCellExperiment (SCE) object using the cleaned flowSet, panel, and metadata.
-   Save the SCE object as "sce_pre_gated.rds".
