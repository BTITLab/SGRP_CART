// script to measure % of myelin in brain slices
// ewelina.bartoszek@unibas.ch


setImageType('BRIGHTFIELD_OTHER');
setColorDeconvolutionStains('{"Name" : "H-DAB modified", "Stain 1" : "Myelin", "Values 1" : "0.67794 0.71094 0.18698", "Stain 2" : "tissue", "Values 2" : "0.55099 0.79298 0.25999", "Background" : " 255 255 255"}');

clearAllObjects();
// detect brain slices
createAnnotationsFromPixelClassifier("tissueClassifier", 2000000.0, 2000000.0, "SPLIT", "SELECT_NEW")

// measure % of myelin in the tissue
addPixelClassifierMeasurements("Myelin", "Myelin")

