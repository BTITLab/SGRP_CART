# This R script is used for quality control and cleaning of pregated flow cytometry data, which was pregated in FlowJo (on debris-removed/live/singlets/CD45+_or_mCherry+). 3 mice of this cohort were excluded because tumors did not engraft (based on bioluminescence imaging.
## The workflow includes loading and preparing data, applying transformations, performing quality control, and constructing a SingleCellExperiment object. 
## This script generates Supplementary Figures 4e and 4f.


rm(list = ls())

library(flowWorkspace)
library(PeacoQC)
library(flowVS)
library(ggcyto)
library(tidyverse)

## Get the path of the active R script
script_dir <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(script_dir) 
workDir <- script_dir
data_folder <- file.path(script_dir, "..", "data")
rdsDir <- "rds"
plotDir <- "plots"

## create metadata file

# create vector with file names
file_name <- list.files(file.path(data_folder, "pregated"), pattern = '.fcs', full = F) # full= FALSE gives you the file name

# create vector with directories of files above
full_file_name <- list.files(file.path(data_folder, "pregated"), pattern = '.fcs', full = TRUE)
list(full_file_name) # full = TRUE gives you the path of the file

# generate dataframe with metadata containing file_name, directory of files, sample_id, condition code and condition name.

md <- data.frame(
  file_name = file_name,
  full_file_name = full_file_name)

md$target <- ifelse(grepl(pattern = "CD19", x = md$file_name), yes = "CD19", no = "EGFRvIII")
md$SGRP <- ifelse(grepl(pattern = "SGRP", x = md$file_name), yes = "SGRP", no = "")
md$tumor <- ifelse(grepl(pattern = "U251vIII", x = md$file_name), yes = "U251vIII_U87", no = "U87")
md$stim <- ifelse(grepl(pattern = "U251vIII", x = md$file_name), yes = "Stim", no = "Unstim")

md$condition <- paste0(md$target, "_", md$SGRP, "_", md$tumor)
md$sample_id <- str_extract(md$file_name, "29.....")

### create flowset
fs1 <- read.flowSet(md$full_file_name, transformation = FALSE, truncate_max_range = FALSE)

md <- dplyr::select(md, -full_file_name)
md

# write_csv(md, file.path(data_folder, "metadata.csv"))

saveRDS(fs1, file.path(script_dir, "rds/flowSet_pregated.rds"))
# fs1 <- readRDS(file.path(script_dir, "rds/flowSet_pregated.rds"))

# provide/create the panel used for the staining
panel <- data.frame(
  antigen = c(colnames(fs1)[1:7], unname(markernames(fs1)[1:12]), "BV-StainBuffer", unname(markernames(fs1)[13:24])), # for some reason there is no BV421 in markernames(fs1) but it is available in colnames... so I had to input it here. But in theory, unname(markernames(fs1) is enough)
  fcs_colname = colnames(fs1)[1:32])

panel$fcs_colname_2 <- gsub(pattern = "FJComp-", replacement = "", x = panel$fcs_colname)
panel$surface_intracell <- c(rep("NA", 6), rep("surface", 26))
panel$marker_class <- c(rep("NA", 6), rep("type", 26))

panel <- panel[, c("fcs_colname", "fcs_colname_2", "antigen", "surface_intracell", "marker_class")] # reorder

panel$antigen <- gsub(pattern = "FJComp-AF ", "", x = panel$antigen)

### transform data (arcsinh)
features.keep <- panel$fcs_colname[!grepl("SC-|Zombie", panel$fcs_colname)] # keep only features needed!

## check if all markers are available in flowset
table(colnames(fs1)[7:32] %in% panel$fcs_colname)
setdiff(colnames(fs1), panel$fcs_colname)

# estimate cofactors for arcsinh-transformation applied to parameters of experiment using estParamFlowVS().

# cofactors <- estParamFlowVS(fs1, channels=features.keep[25]) # crashed at Ly6G-BUV661, CD4-BV711, CD8-SparkBlue574. I therefore have to manually test and add the cofactors!

cofactors <- c(748.6674, 504.5659, 2487.331, 90.43229, 331.5231, 366.2225, 153.9493, 1163.802, 9121.03, 0.9046897, 5, 1753.57, 1083.796, 15.94346, 12984.66, 5, 254.6669, 157.5035, 0.2837763, 254.5802, 0.6310994, 245.8205, 10134.48, 5, 605.971)
names(cofactors) <- features.keep

saveRDS(cofactors, file.path(script_dir, "rds/cofactors.rds"))
# cofactors <- readRDS(file.path(script_dir, "rds/cofactors.rds"))

# perform transformation with cofactors estimated above!
fs1.VS <- transFlowVS(fs1, channels=features.keep, cofactors)

# print and visually inspect result of arc-sinh-transformation
pdf(file.path(script_dir, "plots/arcsinh_transformed/automatic_arcsinh_transformation.pdf"))
for (i in names(markernames(fs1))) {
  # Create the density plot for each marker
  plot <- densityplot(
    as.formula(paste0("~`", i, "`")), 
    fs1.VS, 
    main = paste0(unname(markernames(fs1)[i]), " - Transformed channels")
  )
  print(plot)  # Ensure each plot is printed
}
dev.off()


## Manual correction of estimated cofactors necessary for specific markers (i.e CD8, CD64, MHCII, EGFRvIII, CD4, Ly6G, CD49d, CD11b, mTagBFP2, CD107a, CD206, FAP, CD69)
### each parameter that needs correction is tested with different cofactors 

# manual correction of cofactors 
cofactors2 <- cofactors

cofactors2 <- c(cofactors[1:3], 10000, 750, 750, 3000, 15000, cofactors[9], 500, 500, cofactors[12:15], 1000, cofactors[17], 10000, 1500, cofactors[20], 1500, cofactors[22:23], 1000, cofactors[25]) # creates vector
names(cofactors2) <- features.keep # assign names
fs1.VS <- transFlowVS(fs1, channels=features.keep, cofactors2)

pdf(file.path(script_dir,"plots/arcsinh_transformed/manual_arcsinh_transformation.pdf"))
for (i in names(markernames(fs1))) {
  # Create the density plot for each marker
  plot <- densityplot(
    as.formula(paste0("~`", i, "`")), 
    fs1.VS, 
    main = paste0(unname(markernames(fs1)[i]), " - Transformed channels")
  )
  print(plot)  # Ensure each plot is printed
}
dev.off()



### QC

for (i in 1:length(fs1.VS)){
  peacoqc_res <- PeacoQC(
    ff=fs1.VS[[i]], # 1:length(fs1.VS)
    channels=features.keep[1:13], # which channels to assess for QC
    determine_good_cells="all", # peak calling and MAD method used for filtering
    save_fcs=TRUE, 
    plot=TRUE,
    output_directory = "plots/QC/",
    IT_limit = 0.55, # default IT_limit is 0.55
    MAD=6,
    suffix_fcs= paste0(substr(fs1.VS@phenoData@data$name[i], 1, nchar(fs1.VS@phenoData@data$name[i])-4)))
}


# check if for all input files you also have an output file generated

QC_FCS<- file.path(script_dir,"/plots/QC/PeacoQC_results/fcs_files/")

n.output.pQC <- sapply(QC_FCS, function(dir){length(list.files(dir, pattern = 'fcs'))})


setwd(QC_FCS)
file.rename(list.files(".", full=TRUE),
            gsub(".*291", "291", list.files(".", full=TRUE)))

setwd(script_dir)

location <- "plots/QC/PeacoQC_results/PeacoQC_report.txt"

# Make heatmap overview of the quality control run
pdf(file.path(script_dir,"plots/QC/PeacoQC_results/heatmap_overview.pdf"))
PeacoQCHeatmap(report_location=location, show_values = FALSE,
               show_row_names = FALSE)
dev.off()


# create a report in which results from PeacoQC_report.txt are first matched to the corresponding sample names and then cbind by Filename
a <- lapply(c(1:length(fs1.VS)), function(x) {a<-fs1.VS[[x]]@description$GUID})
x <- cbind(fs1.VS@phenoData@data, Filename=unlist(a))

report <- read.delim("plots/QC/PeacoQC_results/PeacoQC_report.txt")
report
report <- report%>%
  left_join(x, by = "Filename")%>%
  relocate(name)

report$file_name

# save report
write.csv(report, "plots/QC/PeacoQC_results/PeacoQC_report.csv", row.names = F)


# load path of cleaned fcs.files
fcs.gated.cleaned.files <- list.files(QC_FCS, pattern = '.fcs', full = T)


## Load CLEANED fcs files
fs.cleaned <- read.flowSet(fcs.gated.cleaned.files, transformation = FALSE, truncate_max_range = FALSE)


## Construct SingleCellExperiment

# first check whether all files loaded into PeacoQC were also returned!
missing <- md$file_name %in% fs.cleaned@phenoData$name
print(md$sample_id)[!missing]

md$file_name <- gsub(".*291", "291", x = md$file_name) # names did not match!

# bug in the function, not recognizing all the channels https://github.com/HelenaLC/CATALYST/issues/103
for (x in 1:length(fs.cleaned)) {
  keyword(fs.cleaned[[x]])[["$CYT"]] <- "FACS"
}

# extract only fluorscent channels
features.keep <- names(markernames(fs.cleaned))[!grepl("SC-|AF|Zombie", names(markernames(fs.cleaned)))]
panel$marker_class <- "type"

sce <- prepData(fs.cleaned, panel, md, features = features.keep,
                 transform = FALSE,
                 panel_cols = list(channel = "fcs_colname", antigen = "antigen", class =
                                     "marker_class"),
                 md_cols = list(file = "file_name", id = "sample_id", factors = c("target", "SGRP", "tumor", "stim", "condition")))

assay(sce, "exprs") <- counts(sce)

saveRDS(sce, "rds/sce_pregated_cleaned.rds")

# sce <- readRDS("rds/sce_pregated_cleaned.rds")
