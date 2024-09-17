# Description of code - 0_Quality_control_cleaning

## Initialization:

-   Clear the current R environment.
-   Load necessary libraries (`flowWorkspace`, `PeacoQC`, `flowVS`, `ggplot2`, `ggcyto`, `tidyverse`).
-   Set the working directory, data directory, and output directories (`rdsDir`, `plotDir`).

## Load Data:

-   Read the `panel.csv` and `metadata.csv` files.
-   Filter `metadata` to exclude records where the condition is "V".
-   List `.fcs` files in the `CD45_gated` directory.
-   Check if the files in `metadata` match the `.fcs` files and vice versa.

## Create FlowSet:

-   Create a flowSet object `fs1` by reading the `.fcs` files listed in `metadata`.
-   Remove the `full_file_name` column from `metadata`.
-   Save the flowSet object `fs1` as an RDS file.

## Data Transformation:

-   Select features to keep from the `panel` data, excluding specific patterns (`SC-`, `Zombie`, `AF`).
-   Identify features for transformation, further excluding `"FJComp-BFP-A"`.
-   Compute transformation cofactors with `estParamFlowVS()` and save the list.
-   Determine best cofactor for `"FJComp-BFP-A"` and plot results.
-   Add manually determined cofactor=3 for `"FJComp-BFP-A"` to the list of cofactors.
-   Save the updated list of cofactors.
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
