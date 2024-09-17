# Enhancing anti-EGFRvIII CAR T cell therapy against glioblastoma with a paracrine SIRPγ-derived CD47 blocker

This project focuses on enhancing the efficacy of chimeric antigen
receptor (CAR) T cell therapy for glioblastoma (GBM) by engineering a
novel CAR T cell that targets epidermal growth factor receptor variant
III (EGFRvIII). These engineered CAR T cells constitutively secrete a
signal regulatory protein gamma (SIRPγ)-related protein (SGRP) with high
affinity for CD47. This modification aims to overcome key resistance
mechanisms in CAR T cell therapy, including immune suppression and
antigen escape, by promoting GAM-mediated tumor cell phagocytosis. The
scritps in this repository complements the experimental workflows of the
project and allows the reproduction of key computational analyses.

## Table of Contents

-   [Overview](#overview)
-   [Operating System](#operating-system)
-   [R Environment](#r-environment)
-   [Package Dependencies](#package-dependencies)
-   [Installation Instructions](#installation-instructions)
-   [Data](#data)
-   [Usage](#usage)
-   [Contact](#contact)

## Overview

A significant challenge for chimeric antigen receptor (CAR) T cell
therapy against glioblastoma (GBM) is its immunosuppressive tumor
microenvironment, which is densely populated by protumoral
glioma-associated microglia and macrophages (GAMs). Myeloid immune
checkpoint therapy targeting the CD47-SIRPα axis induces GAM phagocytic
function, but CD47 blockade monotherapy is associated with toxicity and
low bioavailability in solid tumors. We engineered a new CAR T cell
against epidermal growth factor receptor variant III (EGFRvIII)
constitutively secreting a signal regulatory protein gamma
(SIRPγ)-related protein (SGRP) with high affinity to CD47.
Anti-EGFRvIII-SGRP CAR T cells eradicated orthotopic EGFRvIII-mosaic GBM
in vivo, promoting GAM-mediated tumor cell phagocytosis. In a CD19+
lymphoma mouse model, anti-CD19-SGRP CAR T cell therapy was superior to
conventional anti-CD19 CAR T. Thus, combination of CAR and SGRP
eliminated bystander tumor cells in a manner that overcomes main
mechanisms of CAR T cell therapy resistance, including immune
suppression and antigen escape.

## Operating System

-   **OS Name and version:** macOS Sonoma 14.5

## R Environment

-   **R Version:** 4.4.1 (2024-06-14) – “Race for Your Life”

## Package Dependencies

The project utilizes the following R packages:

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: left;">Package</th>
<th style="text-align: left;">Version</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">ALL</td>
<td style="text-align: left;">ALL</td>
<td style="text-align: left;">1.46.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">BH</td>
<td style="text-align: left;">BH</td>
<td style="text-align: left;">1.84.0-0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BWStest</td>
<td style="text-align: left;">BWStest</td>
<td style="text-align: left;">0.2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">BayesFactor</td>
<td style="text-align: left;">BayesFactor</td>
<td style="text-align: left;">0.9.12-4.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Biobase</td>
<td style="text-align: left;">Biobase</td>
<td style="text-align: left;">2.64.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiocGenerics</td>
<td style="text-align: left;">BiocGenerics</td>
<td style="text-align: left;">0.50.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BiocManager</td>
<td style="text-align: left;">BiocManager</td>
<td style="text-align: left;">1.30.23</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiocNeighbors</td>
<td style="text-align: left;">BiocNeighbors</td>
<td style="text-align: left;">1.22.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BiocParallel</td>
<td style="text-align: left;">BiocParallel</td>
<td style="text-align: left;">1.38.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiocSingular</td>
<td style="text-align: left;">BiocSingular</td>
<td style="text-align: left;">1.20.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">BiocStyle</td>
<td style="text-align: left;">BiocStyle</td>
<td style="text-align: left;">2.32.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">BiocVersion</td>
<td style="text-align: left;">BiocVersion</td>
<td style="text-align: left;">3.19.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">CATALYST</td>
<td style="text-align: left;">CATALYST</td>
<td style="text-align: left;">1.28.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Cairo</td>
<td style="text-align: left;">Cairo</td>
<td style="text-align: left;">1.6-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ComplexHeatmap</td>
<td style="text-align: left;">ComplexHeatmap</td>
<td style="text-align: left;">2.20.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ConsensusClusterPlus</td>
<td style="text-align: left;">ConsensusClusterPlus</td>
<td style="text-align: left;">1.68.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DBI</td>
<td style="text-align: left;">DBI</td>
<td style="text-align: left;">1.2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">DEoptimR</td>
<td style="text-align: left;">DEoptimR</td>
<td style="text-align: left;">1.1-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DT</td>
<td style="text-align: left;">DT</td>
<td style="text-align: left;">0.33</td>
</tr>
<tr class="even">
<td style="text-align: left;">DelayedArray</td>
<td style="text-align: left;">DelayedArray</td>
<td style="text-align: left;">0.30.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">DelayedMatrixStats</td>
<td style="text-align: left;">DelayedMatrixStats</td>
<td style="text-align: left;">1.26.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Deriv</td>
<td style="text-align: left;">Deriv</td>
<td style="text-align: left;">4.1.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FNN</td>
<td style="text-align: left;">FNN</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">FactoMineR</td>
<td style="text-align: left;">FactoMineR</td>
<td style="text-align: left;">2.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">FlowSOM</td>
<td style="text-align: left;">FlowSOM</td>
<td style="text-align: left;">2.12.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">GenomeInfoDb</td>
<td style="text-align: left;">GenomeInfoDb</td>
<td style="text-align: left;">1.40.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">GenomeInfoDbData</td>
<td style="text-align: left;">GenomeInfoDbData</td>
<td style="text-align: left;">1.2.12</td>
</tr>
<tr class="even">
<td style="text-align: left;">GenomicRanges</td>
<td style="text-align: left;">GenomicRanges</td>
<td style="text-align: left;">1.56.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">GetoptLong</td>
<td style="text-align: left;">GetoptLong</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">GlobalOptions</td>
<td style="text-align: left;">GlobalOptions</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">IDPmisc</td>
<td style="text-align: left;">IDPmisc</td>
<td style="text-align: left;">1.1.21</td>
</tr>
<tr class="even">
<td style="text-align: left;">IRanges</td>
<td style="text-align: left;">IRanges</td>
<td style="text-align: left;">2.38.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">KernSmooth</td>
<td style="text-align: left;">KernSmooth</td>
<td style="text-align: left;">2.23-24</td>
</tr>
<tr class="even">
<td style="text-align: left;">MASS</td>
<td style="text-align: left;">MASS</td>
<td style="text-align: left;">7.3-61</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Matrix</td>
<td style="text-align: left;">Matrix</td>
<td style="text-align: left;">1.7-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">MatrixGenerics</td>
<td style="text-align: left;">MatrixGenerics</td>
<td style="text-align: left;">1.16.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">MatrixModels</td>
<td style="text-align: left;">MatrixModels</td>
<td style="text-align: left;">0.5-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">OlinkAnalyze</td>
<td style="text-align: left;">OlinkAnalyze</td>
<td style="text-align: left;">3.8.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">PMCMRplus</td>
<td style="text-align: left;">PMCMRplus</td>
<td style="text-align: left;">1.9.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">PeacoQC</td>
<td style="text-align: left;">PeacoQC</td>
<td style="text-align: left;">1.14.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">R6</td>
<td style="text-align: left;">R6</td>
<td style="text-align: left;">2.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">RBGL</td>
<td style="text-align: left;">RBGL</td>
<td style="text-align: left;">1.80.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RColorBrewer</td>
<td style="text-align: left;">RColorBrewer</td>
<td style="text-align: left;">1.1-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">RCurl</td>
<td style="text-align: left;">RCurl</td>
<td style="text-align: left;">1.98-1.16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RProtoBufLib</td>
<td style="text-align: left;">RProtoBufLib</td>
<td style="text-align: left;">2.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">RSpectra</td>
<td style="text-align: left;">RSpectra</td>
<td style="text-align: left;">0.16-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rcpp</td>
<td style="text-align: left;">Rcpp</td>
<td style="text-align: left;">1.0.13</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppAnnoy</td>
<td style="text-align: left;">RcppAnnoy</td>
<td style="text-align: left;">0.0.22</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RcppEigen</td>
<td style="text-align: left;">RcppEigen</td>
<td style="text-align: left;">0.3.4.0.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppHNSW</td>
<td style="text-align: left;">RcppHNSW</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">RcppML</td>
<td style="text-align: left;">RcppML</td>
<td style="text-align: left;">0.3.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">RcppProgress</td>
<td style="text-align: left;">RcppProgress</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rgraphviz</td>
<td style="text-align: left;">Rgraphviz</td>
<td style="text-align: left;">2.48.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rhdf5lib</td>
<td style="text-align: left;">Rhdf5lib</td>
<td style="text-align: left;">1.26.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Rmpfr</td>
<td style="text-align: left;">Rmpfr</td>
<td style="text-align: left;">0.9-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">Rtsne</td>
<td style="text-align: left;">Rtsne</td>
<td style="text-align: left;">0.17</td>
</tr>
<tr class="odd">
<td style="text-align: left;">S4Arrays</td>
<td style="text-align: left;">S4Arrays</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">S4Vectors</td>
<td style="text-align: left;">S4Vectors</td>
<td style="text-align: left;">0.42.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ScaledMatrix</td>
<td style="text-align: left;">ScaledMatrix</td>
<td style="text-align: left;">1.12.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">SingleCellExperiment</td>
<td style="text-align: left;">SingleCellExperiment</td>
<td style="text-align: left;">1.26.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">SparseArray</td>
<td style="text-align: left;">SparseArray</td>
<td style="text-align: left;">1.4.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">SparseM</td>
<td style="text-align: left;">SparseM</td>
<td style="text-align: left;">1.84-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">SummarizedExperiment</td>
<td style="text-align: left;">SummarizedExperiment</td>
<td style="text-align: left;">1.34.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">SuppDists</td>
<td style="text-align: left;">SuppDists</td>
<td style="text-align: left;">1.1-9.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">TH.data</td>
<td style="text-align: left;">TH.data</td>
<td style="text-align: left;">1.1-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">UCSC.utils</td>
<td style="text-align: left;">UCSC.utils</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">WRS2</td>
<td style="text-align: left;">WRS2</td>
<td style="text-align: left;">1.1-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">XML</td>
<td style="text-align: left;">XML</td>
<td style="text-align: left;">3.99-0.17</td>
</tr>
<tr class="odd">
<td style="text-align: left;">XVector</td>
<td style="text-align: left;">XVector</td>
<td style="text-align: left;">0.44.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">abind</td>
<td style="text-align: left;">abind</td>
<td style="text-align: left;">1.4-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">afex</td>
<td style="text-align: left;">afex</td>
<td style="text-align: left;">1.3-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ash</td>
<td style="text-align: left;">ash</td>
<td style="text-align: left;">1.0-15</td>
</tr>
<tr class="odd">
<td style="text-align: left;">askpass</td>
<td style="text-align: left;">askpass</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">backports</td>
<td style="text-align: left;">backports</td>
<td style="text-align: left;">1.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">base64enc</td>
<td style="text-align: left;">base64enc</td>
<td style="text-align: left;">0.1-3</td>
</tr>
<tr class="even">
<td style="text-align: left;">bayestestR</td>
<td style="text-align: left;">bayestestR</td>
<td style="text-align: left;">0.14.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">beachmat</td>
<td style="text-align: left;">beachmat</td>
<td style="text-align: left;">2.20.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">beeswarm</td>
<td style="text-align: left;">beeswarm</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bit</td>
<td style="text-align: left;">bit</td>
<td style="text-align: left;">4.0.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">bit64</td>
<td style="text-align: left;">bit64</td>
<td style="text-align: left;">4.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bitops</td>
<td style="text-align: left;">bitops</td>
<td style="text-align: left;">1.0-8</td>
</tr>
<tr class="even">
<td style="text-align: left;">blob</td>
<td style="text-align: left;">blob</td>
<td style="text-align: left;">1.2.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">bookdown</td>
<td style="text-align: left;">bookdown</td>
<td style="text-align: left;">0.40</td>
</tr>
<tr class="even">
<td style="text-align: left;">boot</td>
<td style="text-align: left;">boot</td>
<td style="text-align: left;">1.3-30</td>
</tr>
<tr class="odd">
<td style="text-align: left;">brew</td>
<td style="text-align: left;">brew</td>
<td style="text-align: left;">1.0-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">brio</td>
<td style="text-align: left;">brio</td>
<td style="text-align: left;">1.1.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">broom</td>
<td style="text-align: left;">broom</td>
<td style="text-align: left;">1.0.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">bslib</td>
<td style="text-align: left;">bslib</td>
<td style="text-align: left;">0.8.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cachem</td>
<td style="text-align: left;">cachem</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">callr</td>
<td style="text-align: left;">callr</td>
<td style="text-align: left;">3.7.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">car</td>
<td style="text-align: left;">car</td>
<td style="text-align: left;">3.1-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">carData</td>
<td style="text-align: left;">carData</td>
<td style="text-align: left;">3.0-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cellranger</td>
<td style="text-align: left;">cellranger</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">circlize</td>
<td style="text-align: left;">circlize</td>
<td style="text-align: left;">0.4.16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cli</td>
<td style="text-align: left;">cli</td>
<td style="text-align: left;">3.6.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">clipr</td>
<td style="text-align: left;">clipr</td>
<td style="text-align: left;">0.8.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">clue</td>
<td style="text-align: left;">clue</td>
<td style="text-align: left;">0.3-65</td>
</tr>
<tr class="even">
<td style="text-align: left;">cluster</td>
<td style="text-align: left;">cluster</td>
<td style="text-align: left;">2.1.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">coda</td>
<td style="text-align: left;">coda</td>
<td style="text-align: left;">0.19-4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">codetools</td>
<td style="text-align: left;">codetools</td>
<td style="text-align: left;">0.2-20</td>
</tr>
<tr class="odd">
<td style="text-align: left;">colorRamps</td>
<td style="text-align: left;">colorRamps</td>
<td style="text-align: left;">2.3.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">colorspace</td>
<td style="text-align: left;">colorspace</td>
<td style="text-align: left;">2.1-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">commonmark</td>
<td style="text-align: left;">commonmark</td>
<td style="text-align: left;">1.9.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">conflicted</td>
<td style="text-align: left;">conflicted</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">contfrac</td>
<td style="text-align: left;">contfrac</td>
<td style="text-align: left;">1.1-12</td>
</tr>
<tr class="even">
<td style="text-align: left;">corpcor</td>
<td style="text-align: left;">corpcor</td>
<td style="text-align: left;">1.6.10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">correlation</td>
<td style="text-align: left;">correlation</td>
<td style="text-align: left;">0.8.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">corrplot</td>
<td style="text-align: left;">corrplot</td>
<td style="text-align: left;">0.94</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cowplot</td>
<td style="text-align: left;">cowplot</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">cpp11</td>
<td style="text-align: left;">cpp11</td>
<td style="text-align: left;">0.4.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">crayon</td>
<td style="text-align: left;">crayon</td>
<td style="text-align: left;">1.5.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">credentials</td>
<td style="text-align: left;">credentials</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">crosstalk</td>
<td style="text-align: left;">crosstalk</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">curl</td>
<td style="text-align: left;">curl</td>
<td style="text-align: left;">5.2.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">cytolib</td>
<td style="text-align: left;">cytolib</td>
<td style="text-align: left;">2.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">data.table</td>
<td style="text-align: left;">data.table</td>
<td style="text-align: left;">1.15.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">datawizard</td>
<td style="text-align: left;">datawizard</td>
<td style="text-align: left;">0.12.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">dbplyr</td>
<td style="text-align: left;">dbplyr</td>
<td style="text-align: left;">2.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">deSolve</td>
<td style="text-align: left;">deSolve</td>
<td style="text-align: left;">1.40</td>
</tr>
<tr class="even">
<td style="text-align: left;">deldir</td>
<td style="text-align: left;">deldir</td>
<td style="text-align: left;">2.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dendextend</td>
<td style="text-align: left;">dendextend</td>
<td style="text-align: left;">1.17.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">desc</td>
<td style="text-align: left;">desc</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">devtools</td>
<td style="text-align: left;">devtools</td>
<td style="text-align: left;">2.4.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">dichromat</td>
<td style="text-align: left;">dichromat</td>
<td style="text-align: left;">2.0-0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">diffcyt</td>
<td style="text-align: left;">diffcyt</td>
<td style="text-align: left;">1.24.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">diffobj</td>
<td style="text-align: left;">diffobj</td>
<td style="text-align: left;">0.3.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">digest</td>
<td style="text-align: left;">digest</td>
<td style="text-align: left;">0.6.36</td>
</tr>
<tr class="even">
<td style="text-align: left;">doBy</td>
<td style="text-align: left;">doBy</td>
<td style="text-align: left;">4.6.22</td>
</tr>
<tr class="odd">
<td style="text-align: left;">doParallel</td>
<td style="text-align: left;">doParallel</td>
<td style="text-align: left;">1.0.17</td>
</tr>
<tr class="even">
<td style="text-align: left;">downlit</td>
<td style="text-align: left;">downlit</td>
<td style="text-align: left;">0.4.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">dplyr</td>
<td style="text-align: left;">dplyr</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">dqrng</td>
<td style="text-align: left;">dqrng</td>
<td style="text-align: left;">0.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">drc</td>
<td style="text-align: left;">drc</td>
<td style="text-align: left;">3.0-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">dtplyr</td>
<td style="text-align: left;">dtplyr</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">edgeR</td>
<td style="text-align: left;">edgeR</td>
<td style="text-align: left;">4.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">effectsize</td>
<td style="text-align: left;">effectsize</td>
<td style="text-align: left;">0.8.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ellipse</td>
<td style="text-align: left;">ellipse</td>
<td style="text-align: left;">0.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ellipsis</td>
<td style="text-align: left;">ellipsis</td>
<td style="text-align: left;">0.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">elliptic</td>
<td style="text-align: left;">elliptic</td>
<td style="text-align: left;">1.4-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">emmeans</td>
<td style="text-align: left;">emmeans</td>
<td style="text-align: left;">1.10.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">estimability</td>
<td style="text-align: left;">estimability</td>
<td style="text-align: left;">1.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">evaluate</td>
<td style="text-align: left;">evaluate</td>
<td style="text-align: left;">0.24.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">factoextra</td>
<td style="text-align: left;">factoextra</td>
<td style="text-align: left;">1.0.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">fansi</td>
<td style="text-align: left;">fansi</td>
<td style="text-align: left;">1.0.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">farver</td>
<td style="text-align: left;">farver</td>
<td style="text-align: left;">2.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">fastmap</td>
<td style="text-align: left;">fastmap</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fda</td>
<td style="text-align: left;">fda</td>
<td style="text-align: left;">6.1.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">fds</td>
<td style="text-align: left;">fds</td>
<td style="text-align: left;">1.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">flashClust</td>
<td style="text-align: left;">flashClust</td>
<td style="text-align: left;">1.01-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">flowCore</td>
<td style="text-align: left;">flowCore</td>
<td style="text-align: left;">2.16.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">flowStats</td>
<td style="text-align: left;">flowStats</td>
<td style="text-align: left;">4.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">flowVS</td>
<td style="text-align: left;">flowVS</td>
<td style="text-align: left;">1.36.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">flowViz</td>
<td style="text-align: left;">flowViz</td>
<td style="text-align: left;">1.68.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">flowWorkspace</td>
<td style="text-align: left;">flowWorkspace</td>
<td style="text-align: left;">4.16.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fontawesome</td>
<td style="text-align: left;">fontawesome</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">forcats</td>
<td style="text-align: left;">forcats</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">foreach</td>
<td style="text-align: left;">foreach</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">formatR</td>
<td style="text-align: left;">formatR</td>
<td style="text-align: left;">1.14</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fs</td>
<td style="text-align: left;">fs</td>
<td style="text-align: left;">1.6.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">futile.logger</td>
<td style="text-align: left;">futile.logger</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">futile.options</td>
<td style="text-align: left;">futile.options</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gargle</td>
<td style="text-align: left;">gargle</td>
<td style="text-align: left;">1.5.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">generics</td>
<td style="text-align: left;">generics</td>
<td style="text-align: left;">0.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">gert</td>
<td style="text-align: left;">gert</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggbeeswarm</td>
<td style="text-align: left;">ggbeeswarm</td>
<td style="text-align: left;">0.7.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggcorrplot</td>
<td style="text-align: left;">ggcorrplot</td>
<td style="text-align: left;">0.1.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggcyto</td>
<td style="text-align: left;">ggcyto</td>
<td style="text-align: left;">1.32.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggforce</td>
<td style="text-align: left;">ggforce</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggnewscale</td>
<td style="text-align: left;">ggnewscale</td>
<td style="text-align: left;">0.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggplot2</td>
<td style="text-align: left;">ggplot2</td>
<td style="text-align: left;">3.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggpubr</td>
<td style="text-align: left;">ggpubr</td>
<td style="text-align: left;">0.6.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggrastr</td>
<td style="text-align: left;">ggrastr</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggrepel</td>
<td style="text-align: left;">ggrepel</td>
<td style="text-align: left;">0.9.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggridges</td>
<td style="text-align: left;">ggridges</td>
<td style="text-align: left;">0.5.6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggsci</td>
<td style="text-align: left;">ggsci</td>
<td style="text-align: left;">3.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggside</td>
<td style="text-align: left;">ggside</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ggsignif</td>
<td style="text-align: left;">ggsignif</td>
<td style="text-align: left;">0.6.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">ggstatsplot</td>
<td style="text-align: left;">ggstatsplot</td>
<td style="text-align: left;">0.12.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gh</td>
<td style="text-align: left;">gh</td>
<td style="text-align: left;">1.4.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">gitcreds</td>
<td style="text-align: left;">gitcreds</td>
<td style="text-align: left;">0.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">glue</td>
<td style="text-align: left;">glue</td>
<td style="text-align: left;">1.7.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">gmp</td>
<td style="text-align: left;">gmp</td>
<td style="text-align: left;">0.7-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">googledrive</td>
<td style="text-align: left;">googledrive</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">googlesheets4</td>
<td style="text-align: left;">googlesheets4</td>
<td style="text-align: left;">1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">graph</td>
<td style="text-align: left;">graph</td>
<td style="text-align: left;">1.82.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">gridExtra</td>
<td style="text-align: left;">gridExtra</td>
<td style="text-align: left;">2.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">gtable</td>
<td style="text-align: left;">gtable</td>
<td style="text-align: left;">0.3.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">gtools</td>
<td style="text-align: left;">gtools</td>
<td style="text-align: left;">3.9.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">haven</td>
<td style="text-align: left;">haven</td>
<td style="text-align: left;">2.5.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">hdrcde</td>
<td style="text-align: left;">hdrcde</td>
<td style="text-align: left;">3.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hexbin</td>
<td style="text-align: left;">hexbin</td>
<td style="text-align: left;">1.28.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">highr</td>
<td style="text-align: left;">highr</td>
<td style="text-align: left;">0.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hms</td>
<td style="text-align: left;">hms</td>
<td style="text-align: left;">1.1.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">htmltools</td>
<td style="text-align: left;">htmltools</td>
<td style="text-align: left;">0.5.8.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">htmlwidgets</td>
<td style="text-align: left;">htmlwidgets</td>
<td style="text-align: left;">1.6.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">httpuv</td>
<td style="text-align: left;">httpuv</td>
<td style="text-align: left;">1.6.15</td>
</tr>
<tr class="odd">
<td style="text-align: left;">httr</td>
<td style="text-align: left;">httr</td>
<td style="text-align: left;">1.4.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">httr2</td>
<td style="text-align: left;">httr2</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">hypergeo</td>
<td style="text-align: left;">hypergeo</td>
<td style="text-align: left;">1.2-13</td>
</tr>
<tr class="even">
<td style="text-align: left;">ids</td>
<td style="text-align: left;">ids</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">igraph</td>
<td style="text-align: left;">igraph</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">ini</td>
<td style="text-align: left;">ini</td>
<td style="text-align: left;">0.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">insight</td>
<td style="text-align: left;">insight</td>
<td style="text-align: left;">0.20.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">interp</td>
<td style="text-align: left;">interp</td>
<td style="text-align: left;">1.1-6</td>
</tr>
<tr class="odd">
<td style="text-align: left;">irlba</td>
<td style="text-align: left;">irlba</td>
<td style="text-align: left;">2.3.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">isoband</td>
<td style="text-align: left;">isoband</td>
<td style="text-align: left;">0.2.7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">iterators</td>
<td style="text-align: left;">iterators</td>
<td style="text-align: left;">1.0.14</td>
</tr>
<tr class="even">
<td style="text-align: left;">jpeg</td>
<td style="text-align: left;">jpeg</td>
<td style="text-align: left;">0.1-10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">jquerylib</td>
<td style="text-align: left;">jquerylib</td>
<td style="text-align: left;">0.1.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">jsonlite</td>
<td style="text-align: left;">jsonlite</td>
<td style="text-align: left;">1.8.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">kSamples</td>
<td style="text-align: left;">kSamples</td>
<td style="text-align: left;">1.2-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">kableExtra</td>
<td style="text-align: left;">kableExtra</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">kernlab</td>
<td style="text-align: left;">kernlab</td>
<td style="text-align: left;">0.9-32</td>
</tr>
<tr class="even">
<td style="text-align: left;">knitr</td>
<td style="text-align: left;">knitr</td>
<td style="text-align: left;">1.48</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ks</td>
<td style="text-align: left;">ks</td>
<td style="text-align: left;">1.14.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">labeling</td>
<td style="text-align: left;">labeling</td>
<td style="text-align: left;">0.4.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lambda.r</td>
<td style="text-align: left;">lambda.r</td>
<td style="text-align: left;">1.2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">later</td>
<td style="text-align: left;">later</td>
<td style="text-align: left;">1.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lattice</td>
<td style="text-align: left;">lattice</td>
<td style="text-align: left;">0.22-6</td>
</tr>
<tr class="even">
<td style="text-align: left;">latticeExtra</td>
<td style="text-align: left;">latticeExtra</td>
<td style="text-align: left;">0.6-30</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lazyeval</td>
<td style="text-align: left;">lazyeval</td>
<td style="text-align: left;">0.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">leaps</td>
<td style="text-align: left;">leaps</td>
<td style="text-align: left;">3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lifecycle</td>
<td style="text-align: left;">lifecycle</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">limma</td>
<td style="text-align: left;">limma</td>
<td style="text-align: left;">3.60.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">lme4</td>
<td style="text-align: left;">lme4</td>
<td style="text-align: left;">1.1-35.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">lmerTest</td>
<td style="text-align: left;">lmerTest</td>
<td style="text-align: left;">3.1-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">locfit</td>
<td style="text-align: left;">locfit</td>
<td style="text-align: left;">1.5-9.10</td>
</tr>
<tr class="even">
<td style="text-align: left;">lubridate</td>
<td style="text-align: left;">lubridate</td>
<td style="text-align: left;">1.9.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">magrittr</td>
<td style="text-align: left;">magrittr</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">mapproj</td>
<td style="text-align: left;">mapproj</td>
<td style="text-align: left;">1.2.11</td>
</tr>
<tr class="odd">
<td style="text-align: left;">maps</td>
<td style="text-align: left;">maps</td>
<td style="text-align: left;">3.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">matrixStats</td>
<td style="text-align: left;">matrixStats</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mclust</td>
<td style="text-align: left;">mclust</td>
<td style="text-align: left;">6.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">memoise</td>
<td style="text-align: left;">memoise</td>
<td style="text-align: left;">2.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mgcv</td>
<td style="text-align: left;">mgcv</td>
<td style="text-align: left;">1.9-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">microbenchmark</td>
<td style="text-align: left;">microbenchmark</td>
<td style="text-align: left;">1.4.10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">mime</td>
<td style="text-align: left;">mime</td>
<td style="text-align: left;">0.12</td>
</tr>
<tr class="even">
<td style="text-align: left;">miniUI</td>
<td style="text-align: left;">miniUI</td>
<td style="text-align: left;">0.1.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">minqa</td>
<td style="text-align: left;">minqa</td>
<td style="text-align: left;">1.2.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">mnormt</td>
<td style="text-align: left;">mnormt</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">modelr</td>
<td style="text-align: left;">modelr</td>
<td style="text-align: left;">0.1.11</td>
</tr>
<tr class="even">
<td style="text-align: left;">multcomp</td>
<td style="text-align: left;">multcomp</td>
<td style="text-align: left;">1.4-26</td>
</tr>
<tr class="odd">
<td style="text-align: left;">multcompView</td>
<td style="text-align: left;">multcompView</td>
<td style="text-align: left;">0.1-10</td>
</tr>
<tr class="even">
<td style="text-align: left;">multicool</td>
<td style="text-align: left;">multicool</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">munsell</td>
<td style="text-align: left;">munsell</td>
<td style="text-align: left;">0.5.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">mvtnorm</td>
<td style="text-align: left;">mvtnorm</td>
<td style="text-align: left;">1.2-5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ncdfFlow</td>
<td style="text-align: left;">ncdfFlow</td>
<td style="text-align: left;">2.50.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">nlme</td>
<td style="text-align: left;">nlme</td>
<td style="text-align: left;">3.1-165</td>
</tr>
<tr class="odd">
<td style="text-align: left;">nloptr</td>
<td style="text-align: left;">nloptr</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">nnet</td>
<td style="text-align: left;">nnet</td>
<td style="text-align: left;">7.3-19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">nnls</td>
<td style="text-align: left;">nnls</td>
<td style="text-align: left;">1.5</td>
</tr>
<tr class="even">
<td style="text-align: left;">numDeriv</td>
<td style="text-align: left;">numDeriv</td>
<td style="text-align: left;">2016.8-1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">openssl</td>
<td style="text-align: left;">openssl</td>
<td style="text-align: left;">2.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">paletteer</td>
<td style="text-align: left;">paletteer</td>
<td style="text-align: left;">1.6.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pals</td>
<td style="text-align: left;">pals</td>
<td style="text-align: left;">1.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">parameters</td>
<td style="text-align: left;">parameters</td>
<td style="text-align: left;">0.22.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">patchwork</td>
<td style="text-align: left;">patchwork</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">pbapply</td>
<td style="text-align: left;">pbapply</td>
<td style="text-align: left;">1.7-2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pbkrtest</td>
<td style="text-align: left;">pbkrtest</td>
<td style="text-align: left;">0.5.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">pcaPP</td>
<td style="text-align: left;">pcaPP</td>
<td style="text-align: left;">2.0-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">performance</td>
<td style="text-align: left;">performance</td>
<td style="text-align: left;">0.12.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">pheatmap</td>
<td style="text-align: left;">pheatmap</td>
<td style="text-align: left;">1.0.12</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pillar</td>
<td style="text-align: left;">pillar</td>
<td style="text-align: left;">1.9.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">pkgbuild</td>
<td style="text-align: left;">pkgbuild</td>
<td style="text-align: left;">1.4.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pkgconfig</td>
<td style="text-align: left;">pkgconfig</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">pkgdown</td>
<td style="text-align: left;">pkgdown</td>
<td style="text-align: left;">2.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pkgload</td>
<td style="text-align: left;">pkgload</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">plotrix</td>
<td style="text-align: left;">plotrix</td>
<td style="text-align: left;">3.8-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">plyr</td>
<td style="text-align: left;">plyr</td>
<td style="text-align: left;">1.8.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">png</td>
<td style="text-align: left;">png</td>
<td style="text-align: left;">0.1-8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">polyclip</td>
<td style="text-align: left;">polyclip</td>
<td style="text-align: left;">1.10-7</td>
</tr>
<tr class="even">
<td style="text-align: left;">polynom</td>
<td style="text-align: left;">polynom</td>
<td style="text-align: left;">1.4-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pracma</td>
<td style="text-align: left;">pracma</td>
<td style="text-align: left;">2.4.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">praise</td>
<td style="text-align: left;">praise</td>
<td style="text-align: left;">1.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">prettyunits</td>
<td style="text-align: left;">prettyunits</td>
<td style="text-align: left;">1.2.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">prismatic</td>
<td style="text-align: left;">prismatic</td>
<td style="text-align: left;">1.1.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">processx</td>
<td style="text-align: left;">processx</td>
<td style="text-align: left;">3.8.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">profvis</td>
<td style="text-align: left;">profvis</td>
<td style="text-align: left;">0.3.8</td>
</tr>
<tr class="odd">
<td style="text-align: left;">progress</td>
<td style="text-align: left;">progress</td>
<td style="text-align: left;">1.2.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">promises</td>
<td style="text-align: left;">promises</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ps</td>
<td style="text-align: left;">ps</td>
<td style="text-align: left;">1.7.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">purrr</td>
<td style="text-align: left;">purrr</td>
<td style="text-align: left;">1.0.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">quantreg</td>
<td style="text-align: left;">quantreg</td>
<td style="text-align: left;">5.98</td>
</tr>
<tr class="even">
<td style="text-align: left;">ragg</td>
<td style="text-align: left;">ragg</td>
<td style="text-align: left;">1.3.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rainbow</td>
<td style="text-align: left;">rainbow</td>
<td style="text-align: left;">3.8</td>
</tr>
<tr class="even">
<td style="text-align: left;">rappdirs</td>
<td style="text-align: left;">rappdirs</td>
<td style="text-align: left;">0.3.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rcmdcheck</td>
<td style="text-align: left;">rcmdcheck</td>
<td style="text-align: left;">1.4.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">readr</td>
<td style="text-align: left;">readr</td>
<td style="text-align: left;">2.1.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">readxl</td>
<td style="text-align: left;">readxl</td>
<td style="text-align: left;">1.4.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">rematch</td>
<td style="text-align: left;">rematch</td>
<td style="text-align: left;">2.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rematch2</td>
<td style="text-align: left;">rematch2</td>
<td style="text-align: left;">2.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">remotes</td>
<td style="text-align: left;">remotes</td>
<td style="text-align: left;">2.5.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">renv</td>
<td style="text-align: left;">renv</td>
<td style="text-align: left;">1.0.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">reprex</td>
<td style="text-align: left;">reprex</td>
<td style="text-align: left;">2.1.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">reshape</td>
<td style="text-align: left;">reshape</td>
<td style="text-align: left;">0.8.9</td>
</tr>
<tr class="even">
<td style="text-align: left;">reshape2</td>
<td style="text-align: left;">reshape2</td>
<td style="text-align: left;">1.4.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rjson</td>
<td style="text-align: left;">rjson</td>
<td style="text-align: left;">0.2.21</td>
</tr>
<tr class="even">
<td style="text-align: left;">rlang</td>
<td style="text-align: left;">rlang</td>
<td style="text-align: left;">1.1.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rmarkdown</td>
<td style="text-align: left;">rmarkdown</td>
<td style="text-align: left;">2.27</td>
</tr>
<tr class="even">
<td style="text-align: left;">robustbase</td>
<td style="text-align: left;">robustbase</td>
<td style="text-align: left;">0.99-3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">roxygen2</td>
<td style="text-align: left;">roxygen2</td>
<td style="text-align: left;">7.3.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">rprojroot</td>
<td style="text-align: left;">rprojroot</td>
<td style="text-align: left;">2.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rrcov</td>
<td style="text-align: left;">rrcov</td>
<td style="text-align: left;">1.7-5</td>
</tr>
<tr class="even">
<td style="text-align: left;">rstatix</td>
<td style="text-align: left;">rstatix</td>
<td style="text-align: left;">0.7.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rstudioapi</td>
<td style="text-align: left;">rstudioapi</td>
<td style="text-align: left;">0.16.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">rsvd</td>
<td style="text-align: left;">rsvd</td>
<td style="text-align: left;">1.0.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rversions</td>
<td style="text-align: left;">rversions</td>
<td style="text-align: left;">2.1.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">rvest</td>
<td style="text-align: left;">rvest</td>
<td style="text-align: left;">1.0.4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sandwich</td>
<td style="text-align: left;">sandwich</td>
<td style="text-align: left;">3.1-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">sass</td>
<td style="text-align: left;">sass</td>
<td style="text-align: left;">0.4.9</td>
</tr>
<tr class="odd">
<td style="text-align: left;">scales</td>
<td style="text-align: left;">scales</td>
<td style="text-align: left;">1.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">scater</td>
<td style="text-align: left;">scater</td>
<td style="text-align: left;">1.32.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">scatterplot3d</td>
<td style="text-align: left;">scatterplot3d</td>
<td style="text-align: left;">0.3-44</td>
</tr>
<tr class="even">
<td style="text-align: left;">scuttle</td>
<td style="text-align: left;">scuttle</td>
<td style="text-align: left;">1.14.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">selectr</td>
<td style="text-align: left;">selectr</td>
<td style="text-align: left;">0.4-2</td>
</tr>
<tr class="even">
<td style="text-align: left;">sessioninfo</td>
<td style="text-align: left;">sessioninfo</td>
<td style="text-align: left;">1.2.2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">shape</td>
<td style="text-align: left;">shape</td>
<td style="text-align: left;">1.4.6.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">shiny</td>
<td style="text-align: left;">shiny</td>
<td style="text-align: left;">1.9.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sitmo</td>
<td style="text-align: left;">sitmo</td>
<td style="text-align: left;">2.0.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">snow</td>
<td style="text-align: left;">snow</td>
<td style="text-align: left;">0.4-4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sourcetools</td>
<td style="text-align: left;">sourcetools</td>
<td style="text-align: left;">0.1.7-1</td>
</tr>
<tr class="even">
<td style="text-align: left;">sparseMatrixStats</td>
<td style="text-align: left;">sparseMatrixStats</td>
<td style="text-align: left;">1.16.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">statmod</td>
<td style="text-align: left;">statmod</td>
<td style="text-align: left;">1.5.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">statsExpressions</td>
<td style="text-align: left;">statsExpressions</td>
<td style="text-align: left;">1.5.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">stringi</td>
<td style="text-align: left;">stringi</td>
<td style="text-align: left;">1.8.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">stringr</td>
<td style="text-align: left;">stringr</td>
<td style="text-align: left;">1.5.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">survival</td>
<td style="text-align: left;">survival</td>
<td style="text-align: left;">3.7-0</td>
</tr>
<tr class="even">
<td style="text-align: left;">svglite</td>
<td style="text-align: left;">svglite</td>
<td style="text-align: left;">2.1.3</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sys</td>
<td style="text-align: left;">sys</td>
<td style="text-align: left;">3.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">systemfonts</td>
<td style="text-align: left;">systemfonts</td>
<td style="text-align: left;">1.1.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">testthat</td>
<td style="text-align: left;">testthat</td>
<td style="text-align: left;">3.2.1.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">textshaping</td>
<td style="text-align: left;">textshaping</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tibble</td>
<td style="text-align: left;">tibble</td>
<td style="text-align: left;">3.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">tidyr</td>
<td style="text-align: left;">tidyr</td>
<td style="text-align: left;">1.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tidyselect</td>
<td style="text-align: left;">tidyselect</td>
<td style="text-align: left;">1.2.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">tidyverse</td>
<td style="text-align: left;">tidyverse</td>
<td style="text-align: left;">2.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">timechange</td>
<td style="text-align: left;">timechange</td>
<td style="text-align: left;">0.3.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">tinytex</td>
<td style="text-align: left;">tinytex</td>
<td style="text-align: left;">0.52</td>
</tr>
<tr class="odd">
<td style="text-align: left;">tweenr</td>
<td style="text-align: left;">tweenr</td>
<td style="text-align: left;">2.0.3</td>
</tr>
<tr class="even">
<td style="text-align: left;">tzdb</td>
<td style="text-align: left;">tzdb</td>
<td style="text-align: left;">0.4.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">urlchecker</td>
<td style="text-align: left;">urlchecker</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">usethis</td>
<td style="text-align: left;">usethis</td>
<td style="text-align: left;">3.0.0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">utf8</td>
<td style="text-align: left;">utf8</td>
<td style="text-align: left;">1.2.4</td>
</tr>
<tr class="even">
<td style="text-align: left;">uuid</td>
<td style="text-align: left;">uuid</td>
<td style="text-align: left;">1.2-1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">uwot</td>
<td style="text-align: left;">uwot</td>
<td style="text-align: left;">0.2.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">vctrs</td>
<td style="text-align: left;">vctrs</td>
<td style="text-align: left;">0.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">vipor</td>
<td style="text-align: left;">vipor</td>
<td style="text-align: left;">0.4.7</td>
</tr>
<tr class="even">
<td style="text-align: left;">viridis</td>
<td style="text-align: left;">viridis</td>
<td style="text-align: left;">0.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">viridisLite</td>
<td style="text-align: left;">viridisLite</td>
<td style="text-align: left;">0.4.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">vroom</td>
<td style="text-align: left;">vroom</td>
<td style="text-align: left;">1.6.5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">waldo</td>
<td style="text-align: left;">waldo</td>
<td style="text-align: left;">0.5.2</td>
</tr>
<tr class="even">
<td style="text-align: left;">whisker</td>
<td style="text-align: left;">whisker</td>
<td style="text-align: left;">0.4.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">withr</td>
<td style="text-align: left;">withr</td>
<td style="text-align: left;">3.0.1</td>
</tr>
<tr class="even">
<td style="text-align: left;">xfun</td>
<td style="text-align: left;">xfun</td>
<td style="text-align: left;">0.46</td>
</tr>
<tr class="odd">
<td style="text-align: left;">xml2</td>
<td style="text-align: left;">xml2</td>
<td style="text-align: left;">1.3.6</td>
</tr>
<tr class="even">
<td style="text-align: left;">xopen</td>
<td style="text-align: left;">xopen</td>
<td style="text-align: left;">1.0.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">xtable</td>
<td style="text-align: left;">xtable</td>
<td style="text-align: left;">1.8-4</td>
</tr>
<tr class="even">
<td style="text-align: left;">yaml</td>
<td style="text-align: left;">yaml</td>
<td style="text-align: left;">2.3.10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">zeallot</td>
<td style="text-align: left;">zeallot</td>
<td style="text-align: left;">0.1.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">zip</td>
<td style="text-align: left;">zip</td>
<td style="text-align: left;">2.3.1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">zlibbioc</td>
<td style="text-align: left;">zlibbioc</td>
<td style="text-align: left;">1.50.0</td>
</tr>
<tr class="even">
<td style="text-align: left;">zoo</td>
<td style="text-align: left;">zoo</td>
<td style="text-align: left;">1.8-12</td>
</tr>
</tbody>
</table>

## Installation Instructions

Follow these steps to set up the environment and run the project:

1.  **Clone the Repository:**

    git clone <https://github.com/BTITLab/SGRP_CART>

2.  Set Up R Environment:

    Ensure R version 4.2.1 is installed. You can download it from CRAN.

    Install the required R packages by running the following in R:

    `# Install renv if not already installed install.packages("renv")`

    `# Restore the project library`

    `renv::restore()`

3.  Run the Scripts:

-   Navigate to the project directory.
-   Open the R scripts in RStudio or your preferred R environment.
-   Execute the scripts as per their intended sequence.
