# Description of code - Hematological_parameters.R

## Initialization:

-   Clear the current R environment.
-   Load the necessary library (`tidyverse`).

## Load and Prepare Data:

-   Read in the `toxicity.rds` file, removing specific columns (`BASO#(10^9/L)`, `BASO%(%)`, `[HYPER-He(%)]`).
-   Transform the data from wide format to long format, with `Variable` and `Value` columns.

## Scale and Center Data:

-   For each day, scale and center the selected variables.
-   Transform the scaled data to long format.

## Plotting:

-   Open a PDF device to save the plot.
-   Filter the data for specific hematological parameters (`HGB.g`, `MONO#`, `NEUT#`, `NRBC#`, `PLT.10`, `RBC.10`, `RET#`).
-   Create a scatter plot with the following features:
    -   Points are grouped by `sample_ID` and colored by `condition`.
    -   Plot includes a mean summary line.
    -   The y-axis is labeled as "Z-Score".
    -   Facet the plot by `Variable` with free scales.
    -   The title of the plot is "Hematological parameters after one treatment dose."
-   Close the PDF device.

## Mixed-Effects Model Fitting:

-   Load the `lme4` library.
-   Filter the scaled and centered data for the selected hematological parameters.
-   Initialize an empty list to store models.
-   Fit a mixed-effects model for each variable:
    -   The model predicts `Value` using `Day`, `condition`, and their interaction, with a random effect for `sample_ID`.
    -   Store the summary statistics for each model in a list.
-   Name the models list using the corresponding variable names.


## Post-Hoc Testing:

-   Load the `emmeans` library.
-   Fit the mixed-effects model for `NEUT#(10^9/L)` specifically.
-   Perform post-hoc tests using estimated marginal means (emmeans) to compare `condition` within each `Day`.

