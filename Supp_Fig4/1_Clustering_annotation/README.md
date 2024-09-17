# Description of code - Clustering_and_annotation_pregated_cleaned.Rmd
This script is the extension of the file 'Quality_control_cleaning_pregated.R' and generates Supplementary Figures 4e and 4f.
# This R script describes the clustering of Flow Cytometry data (using FlowSOM), dimensionality reduction with t-SNE and subsequent cluster merging/annotation and final visualization of cluster-defining marker expression (heatmap) and cluster abundance. 

1. Setup and Library Loading:
 - Clear R environment and load necessary libraries for data manipulation and visualization (flowCore, flowWorkspace, ggcyto, kableExtra, CATALYST, cowplot, RColorBrewer).

-  set working directory based on the location of the active script and defines paths for data, RDS files, and plots.

2. Loading Data:

- read in metadata from a CSV file and adjusts file names within the metadata.

- load preprocessed SingleCellExperiment (PeacQC-cleaned) object from an RDS file (generated in 'Quality_control_cleaning_pregated.R'.

3. Clustering Analysis:

- perform cell clustering using the FlowSOM method with specified parameters. Tumor markers are excluded, focusing only on immune cell markers.

- The results are saved as an RDS file.

4. Dimensionality Reduction with t-SNE:

- t-SNE is applied to the clustered data to reduce dimensionality and visualize the clustering results. Only a subset of cells and features are used.

- The t-SNE results are saved to an RDS file.

5. Visualization to annotate/merge clusters:

- generate and saves various plots:
  - Marker expression for each feature in the t-SNE plot.
  - t-SNE plots faceted by condition.
  - Annotation of clusters with marker expression and condition-specific plots.

6. Cluster Annotation and Merging:

- Clusters are annotated based on their marker expression patterns.

- perform manual merging of clusters according to a predefined mapping, consolidating similar clusters into broader categories.

- The updated SCE object with merged clusters is saved to an RDS file.

7. Final Visualization:

- After merging, t-SNE plots are updated to reflect the new cluster annotations and saved.

- A heatmap is generated to show the expression of cluster-defining markers across merged clusters and saved as a PDF.

- A barplot displaying the relative proportions of the individual clusters within each sample grouped by conditions and saved as a PDF.


