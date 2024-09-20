rm(list = ls())

library(flowWorkspace)
library(PeacoQC)
library(flowVS)
library(ggplot2)
library(ggcyto)
library(tidyverse)
library(cowplot)

workingDir <- getwd()
data_folder <- "../data"
rdsDir <- "rds"
plotDir <- "plots"

### Load data
panel <- read.csv(file.path(data_folder, "panel.csv"))

## path to fcs files
fcs.gated.files <- list.files(file.path(data_folder, "CD45_gated fcs-files"), pattern = '.fcs', full = F)
fcs.gated.files.f <- list.files(file.path(data_folder, "CD45_gated fcs-files"), pattern = '.fcs', full = T)

## create metadata table
md <- data.frame(full_file_name=fcs.gated.files.f, file_name=fcs.gated.files) # add file path and file names
md$sample_id <- gsub(" ", "_", gsub("_CD19.*", "", md$file_name, fixed = F)) # extract sampleID
md$condition <- factor(gsub("_[A-Z][0-9].*", "", md$sample_id, fixed = F))
md$patient_id <- factor(gsub(".*_[A-Z][0-9]_.._", "", md$sample_id, fixed = F))
write.csv(md, file.path(data_folder, "CD45_gated fcs-files/metadata.csv"), row.names = F)

table(fcs.gated.files %in% md$file_name) # 5 samples will be removed
table(md$file_name %in% fcs.gated.files)

### create flowset
fs <- read.flowSet(md$full_file_name, transformation = FALSE, truncate_max_range = FALSE)

md <- dplyr::select(md, -full_file_name)

saveRDS(fs, file.path(rdsDir, "flowSet_CD45_single_live.rds"))

## remove FJComp-BUV661-A because it doesn't run
features.cofact <- panel$fcs_colname[!grepl("SC-|AF|Zombie|FJComp-BUV661-A", panel$fcs_colname)]

# cofactors <- estParamFlowVS(fs, channels=features.cofact)
# names(cofactors) <- features.cofact
# saveRDS(cofactors, file.path(rdsDir, "cofactors.rds"))
cofactors <- readRDS(file.path(rdsDir, "cofactors.rds"))

### visualise plots to find right cofactore for FJComp-BUV661-A
x<-transFlowVS(fs, channels="FJComp-BUV661-A", 900)
densityplot(~`FJComp-BUV661-A`, x)
CytoExploreR::cyto_plot(x,
                        parent = "root",
                        channels = c("FJComp-BUV661-A", "FSC-H"))
ggcyto::ggcyto(x, aes(x = `FJComp-BUV661-A`, y =  `FSC-H`)) + geom_hex(bins = 128)
ggcyto::ggcyto(x, aes(x = `FJComp-BUV661-A`, y =  `FSC-H`)) + geom_hex(bins = 200)+facet_null()

# ## add cofactor for FJComp-BUV661-A manually, at the right spot
# which(features.keep == "FJComp-BUV661-A")
# cofactors2 <- c(cofactors[1:4], 900, cofactors[5:17])
# names(cofactors2) <- c(names(cofactors)[1:4], "FJComp-BUV661-A", names(cofactors)[5:17])
# saveRDS(cofactors2, file.path(rdsDir, "cofactors_add_BUV661cofact900.rds"))
cofactors2 <- readRDS(file.path(rdsDir, "cofactors_add_BUV661cofact900.rds"))

# improve cofactors for other channels
cofactors3 <- cofactors2
cofactors3["FJComp-BUV661-A"] <- 900
cofactors3["FJComp-BFP-A"] <- 900
cofactors3["FJComp-BV605-A"] <- 800
cofactors3["FJComp-BV785-A"] <- 850
cofactors3["FJComp-FITC-A"] <- 900
cofactors3["FJComp-NovaFluor Blue 610-70S-A"] <- 700
cofactors3["FJComp-PE-Cy7-A"] <- 1000
cofactors3["FJComp-APC-A"] <- 900
cofactors3["FJComp-Alexa Fluor 700-A"] <- 900
cofactors3["FJComp-APC-Cy7-A"] <- 900

fs.VS <- transFlowVS(fs, channels=names(cofactors3), cofactors3)
saveRDS(fs.VS, file.path(rdsDir, "flowSet_CD45_single_live_arcsinh_transformed_add_BUV661cofact900.rds"))
# fs.VS <- readRDS(file.path(rdsDir, "flowSet_CD45_single_live_arcsinh_transformed_add_BUV661cofact900.rds"))



pdf(file.path(plotDir, "arcsinh_transformation.pdf"))
densityplot(~`FJComp-BUV395-A`, fs.VS, main="CD11b - Transfromed channels")
densityplot(~`FJComp-BUV496-A`, fs.VS, main="CD11c - Transfromed channels")
densityplot(~`FJComp-BUV563-A`, fs.VS, main="CD49d - Transfromed channels")
densityplot(~`FJComp-BUV661-A`, fs.VS, main="Ly6G - Transfromed channels")
densityplot(~`FJComp-BUV737-A`, fs.VS, main="CD45 - Transfromed channels")
densityplot(~`FJComp-BFP-A`, fs.VS, main="Tumor - Transfromed channels")
densityplot(~`FJComp-BV785-A`, fs.VS, main="Ly6C - Transfromed channels")
densityplot(~`FJComp-APC-A`, fs.VS, main="XCR1 - Transfromed channels")
densityplot(~`FJComp-APC-Fire 810-A`, fs.VS, main="P2ry12 - Transfromed channels")
densityplot(~`FJComp-BV605-A`, fs.VS, main="CD80 - Transfromed channels")
densityplot(~`FJComp-NovaFluor Blue 610-70S-A`, fs.VS, main="MHCII - Transfromed channels")
densityplot(~`FJComp-PE-Cy5-A`, fs.VS, main="CD86 - Transfromed channels")
densityplot(~`FJComp-PE-Cy7-A`, fs.VS, main="PDL1 - Transfromed channels")
densityplot(~`FJComp-FITC-A`, fs.VS, main="Siglec1 - Transfromed channels")
densityplot(~`FJComp-Alexa Fluor 700-A`, fs.VS, main="CD206 - Transfromed channels")
densityplot(~`FJComp-APC-Cy7-A`, fs.VS, main="CD163 - Transfromed channels")
dev.off()

pdf(file.path(plotDir, "comparison_transformation.pdf"))
lapply(names(cofactors3), function(x) {
  a1 <-ggplot(fs, aes(x = get(x), group = name)) + 
    geom_density(alpha = 0.2) +
    xlim(c(-1e4,5e4))
  a2 <-ggplot(fs.VS, aes(x = get(x), group = name)) + 
    geom_density(alpha = 0.2)+ 
    scale_x_continuous(name = paste0(x))
  plot_grid(a1, a2, labels = c('no transformation', 'asinh'))
})
dev.off()


### QC

for (i in 1:length(fs.VS)){
  peacoqc_res <- PeacoQC(
    ff=fs.VS[[i]], 
    channels=features.cofact, 
    determine_good_cells="all", 
    save_fcs=TRUE, 
    plot=TRUE,
    # output_directory = "", # default is working directory
    IT_limit = 0.55,
    MAD=6,
    suffix_fcs= paste0(substr(fs.VS@phenoData@data$name[i], 1, nchar(fs.VS@phenoData@data$name[i])-4)))
}

QC_FCS <- "PeacoQC_results/fcs_files"

setwd(QC_FCS)

file.rename(list.files(".", full=TRUE),
            gsub("filedeaa[[:alnum:]]*CD19", "CD19", list.files(".", full=TRUE)))

setwd(workingDir)

location <- "PeacoQC_results/PeacoQC_report.txt"

## Make heatmap overview of the quality control run
pdf(file.path(workingDir, "PeacoQC_results/heatmap_overview.pdf"))
PeacoQCHeatmap(report_location=location, show_values = FALSE,
               show_row_names = FALSE)
dev.off()

a <- lapply(c(1:length(fs.VS)), function(x) {a<-fs.VS[[x]]@description$GUID})
x <- cbind(fs.VS@phenoData@data, Filename=unlist(a))

report <- read.delim(file.path(workingDir, "PeacoQC_results/PeacoQC_report.txt"))
report <- report%>%
  left_join(x, by = "Filename")%>%
  relocate(name)

write.csv(report, file.path(workingDir, "PeacoQC_results/PeacoQC_report.csv"), row.names = F)

### creating SCE object ###

fcs.gated.cleaned.files <- list.files(QC_FCS, pattern = '.fcs', full = T)
fs.cleaned <- flowCore::read.flowSet(fcs.gated.cleaned.files, transformation = FALSE, truncate_max_range = FALSE)


## bug in the function, not recognizing all the channels https://github.com/HelenaLC/CATALYST/issues/103

for (x in 1:length(fs.cleaned)) {
  keyword(fs.cleaned[[x]])[["$CYT"]] <- "FACS"
}

sce <- prepData(fs.cleaned, panel, md, features = names(cofactors3),
                transform = FALSE,
                panel_cols = list(channel = "fcs_colname", 
                                  antigen = "antigen", 
                                  class ="marker_class"),
                md_cols = list(file = "file_name", 
                               id = "sample_id", 
                               factors = c("condition","patient_id")))

saveRDS(sce, file.path(rdsDir, "sce_pre_gated.rds"))
