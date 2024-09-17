// script to segment and classify cells witin brain slices
// ewelina.bartoszek@unibas.ch


// set color deconvolution
setImageType('BRIGHTFIELD_H_DAB');
setColorDeconvolutionStains('{"Name" : "H-DAB default", "Stain 1" : "Hematoxylin", "Values 1" : "0.65111 0.70119 0.29049", "Stain 2" : "DAB", "Values 2" : "0.26917 0.56824 0.77759", "Background" : " 255 255 255"}');
// detect brain slices
createAnnotationsFromPixelClassifier("Tissue", 1000000.0, 100000.0, "SPLIT","SELECT_NEW")
// segment cells
runPlugin('qupath.imagej.detect.cells.PositiveCellDetection', '{"detectionImageBrightfield": "Optical density sum",  "requestedPixelSizeMicrons": 0.5,  "backgroundRadiusMicrons": 8.0,  "medianRadiusMicrons": 0.0,  "sigmaMicrons": 1.5,  "minAreaMicrons": 8.0,  "maxAreaMicrons": 400.0,  "threshold": 0.15,  "maxBackground": 2.0,  "watershedPostProcess": true,  "excludeDAB": false,  "cellExpansionMicrons": 2.0,  "includeNuclei": true,  "smoothBoundaries": true,  "makeMeasurements": true,  "thresholdCompartment": "Cytoplasm: DAB OD mean",  "thresholdPositive1": 0.15,  "thresholdPositive2": 0.4,  "thresholdPositive3": 0.6000000000000001,  "singleThreshold": true}')
