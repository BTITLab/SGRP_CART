# Description for WorkflowMyelin.groovy:

## Create a project in QuPath
-	Empty folder as a base structure for the project
## Import images
-	Drag and drop images
-	Assign correct image type (Fluorescence or H-DAB)
-	Perform color deconvolution for H-DAB images
## Create pixel classifiers to detect tissue
-	Here called “BrainTissue”
## Cell segmentation
-	Use DAPI or Hematoxylin staining as nuclei marker
## Cell classification 
-	Define threshold for cell positivity
## Myelin measurement
-	Define threshold for positive signal and save a pixel classifier
