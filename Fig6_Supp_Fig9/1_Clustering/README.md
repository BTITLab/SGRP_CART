# Description of code - 1_Clustering

## Initialization:

-   Clear the current R environment. Load necessary libraries (`tidyverse`, `flowCore`, `flowWorkspace`, `CATALYST`, `RColorBrewer`).
-   Set directories for previous data, cleaned FCS files, data folder, plots, and RDS output.

## Color Palette Setup:

-   Define custom color palettes (`myPalette`, `my_scale_fill`, `my_scale_col`) for plots.

## Load and Process Cleaned FCS Files:

-   List all `.fcs` files from the quality control directory.
-   Load the cleaned FCS files into a `flowSet` object (`fs.cleaned`).

## Create Metadata Table:

-   Extract file names, sample IDs, and conditions from the FCS file names.
-   Determine patient IDs and organize the metadata into a data frame (`md`).

## Load Panel Data:

-   Load the `panel.csv` file, which contains information about the markers.

## Construct SingleCellExperiment Object:

-   Correct a bug in the FCS files by setting the \$CYT keyword to "FACS".
-   Select features to keep for further analysis, excluding unwanted patterns (`SC-`, `Time`, `AF`, `Zombie`).
-   Create a `SingleCellExperiment` object (`sce1`) using the cleaned FCS files, panel data, and metadata.
-   Save the `SingleCellExperiment` object as an RDS file.

## Process Assay Data:

-   Assign expression data to the `exprs` assay in `sce1`.
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
