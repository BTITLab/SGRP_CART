# Description of code - Quality_control_cleaning_pregated.R

# This R script is used for quality control and cleaning of pregated flow cytometry data, which was pregated in FlowJo (on debris-removed/live/singlets/CD45+_or_mCherry+). 3 mice of this cohort were excluded because tumors did not engraft (based on bioluminescence imaging.
## The workflow includes loading and preparing data, applying transformations, performing quality control, and constructing a SingleCellExperiment object. 
## This script generates Supplementary Figures 4e and 4f.

1. Initialization

- Clear Environment: Remove all objects from the current R session to start fresh.

- Load Libraries: Import necessary R packages for flow cytometry analysis, data transformation, visualization, and data manipulation.

 - Set Directories: Define paths for the current script, data folder, RDS output, and plot saving.


2. Metadata Preparation

- List .fcs Files: Identify and create a vector of filenames and full paths of the .fcs files that are pregated.
- Generate Metadata DataFrame: Create a metadata dataframe that includes filenames, sample IDs, and condition codes based on patterns in the filenames.

3. FlowSet Creation

- Read .fcs Files: Load the .fcs files into a flowSet object.

4. Panel Setup

- Define Panel Information: Create a panel dataframe detailing the antigens, corresponding channels in the flow cytometry data, and whether the markers are surface or intracellular.

5. Data Transformation

- Select Features to Keep: Identify the features (channels) to be retained, excluding irrelevant markers like "SC-" or "Zombie".

- Check Marker Availability: Ensure all specified markers are present in the flowSet.

- Estimate Cofactors: Manually estimate cofactors for the arcsinh transformation after initial automatic estimation fails for some markers.

- Perform Transformation: Apply the arcsinh transformation to the flow cytometry data using the estimated cofactors.

- Save Transformed Data: Visualize and save the results of the transformation as PDF plots.

- Manual Correction of Cofactors: Manually adjust cofactors for specific markers (e.g., CD8, CD64) and reapply the transformation. This step ensures that the transformed data is accurate and consistent for subsequent analysis.

- Visual Inspection: Generate density plots to inspect the transformed data and ensure the correctness of manual cofactor adjustments.

7. Quality Control (QC)

- Perform QC with PeacoQC: Use the PeacoQC package to assess and filter out poor-quality events in the flow cytometry data. Results are saved, and a heatmap overview of the QC process is generated.

- Generate QC Report: Combine QC results with sample metadata and save the report as a CSV file.

- Rename Files: Ensure that output filenames from QC match the original sample names.

8. Load Cleaned Data and Prepare SingleCellExperiment

- Load Cleaned .fcs Files: Load the cleaned flow cytometry data after QC.

- Prepare SingleCellExperiment Object:

- Match Metadata: Ensure that the metadata matches the cleaned files.

- Fix Channel Issues: Adjust channel names in the cleaned data to fix any bugs related to channel recognition.

- Select Features: Extract fluorescent channels for the final analysis.

- Construct SingleCellExperiment Object: Create the SingleCellExperiment object, which integrates the cleaned data, panel information, and metadata.

- Save SCE Object: Save the final SingleCellExperiment object for downstream analysis.

- This script provides a comprehensive workflow for preprocessing flow cytometry data, ensuring quality control, and organizing the data for further analysis.