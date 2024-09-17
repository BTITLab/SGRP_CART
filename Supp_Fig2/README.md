## Description of code - 20240513_TripleCoculture_Trial_Analysis_Reporting_Summary.R

# Script Start

## Initialize Environment

## Clear Environment: Remove all objects to start with a clean workspace.

# Load Libraries: Import necessary libraries (devtools, usethis, ggplot2, etc.) for data manipulation, plotting, and statistical analysis.

Set Working Directory

- Determine Script Path: Use the rstudioapi to get the path of the currently active script.
- Set Working Directory: Set the working directory to the script's location to ensure relative paths work correctly.

# Load Data
- Read Data: Load a CSV file named counts.csv from the data folder into a dataframe (df).
- Rename Columns: Rename the first column to sample_id for clarity.

# Filter Data:
- Exclude rows where sample_id contains "FMO".
- Keep rows where sample_id ends with .fcs.
- Remove the 19th column as it is unnecessary for further analysis.

# Sanitize Column Names: Replace hyphens (-) in column names with dots (.) to prevent issues in downstream functions.

# Clean sample_id:
- Remove the first three characters (well ID) from sample_id.
- Remove the .fcs extension from sample_id.

# Create Metadata
- Categorize Samples:
  - Create a CAR column based on the presence of CD19 or EGFRvIII in sample_id.
  - Create a SGRP column based on the presence of SGRP in sample_id.
  - Generate a condition column combining CAR and SGRP.
  - Extract donor information and store it in a donor column.
  - Reorder Columns: Move the condition column to the beginning of the dataframe.

# Data Validation:
- Check for any NA values in the dataframe.
- Convert specific columns to factors and others to numeric.
- Validate that no NA values were introduced during conversion.

# Generate Heatmap
- Subset Data: Retain only relevant columns for heatmap generation.
- Order Data: Sort the dataframe by the condition column.
- Scale Data: Transpose and scale selected columns.
- Setup Annotations: Define color annotations based on the condition column.
- Create Heatmap: Generate the heatmap with customized ordering and annotations.
- Save Heatmap: Save the generated heatmap as a PDF.

# Statistical Analysis: Tukey HSD
- Initialize Results Storage: Create an empty dataframe to store results of Tukey’s HSD tests.
- Loop Through Data:
- Perform ANOVA on each relevant column.
- If the test is significant, perform Tukey’s HSD test.
- Store the results in the initialized dataframe.
- Clean and Factorize:
- Modify the comparison column to remove extraneous text.
- Replace hyphens with underscores in comparison.
- Factorize the comparison column for ordered levels.
- Annotate Heatmap with Statistical Significance
- Extract and Clean Tukey HSD Results: For each level of comparison, subset relevant columns (p adj, Variable, comparison).
- Add Annotations:
- Annotate the heatmap rows with significance levels derived from Tukey HSD results.
- Customize annotation colors to indicate significance.
- Save Annotated Heatmap: Save the heatmap with significance annotations as a PDF.

# Session Information
Record Session Info: Capture and log the current R session details for reproducibility.