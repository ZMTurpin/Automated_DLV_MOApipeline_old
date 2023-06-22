# Automated_DLV_MOApipeline_old

#These scripts are intended to automate the Bass Lab standardized pipeline (originally developed in R by Daniel Vera) for processing fastq files from PE Illumina NGS into segmentation-ready bedgraph files and browser-ready bigwig files.


#NOTE: this script is generalized and contains commented lines requiring paths to genome indices (bt2), "chromsizes" files, and is intended to be run from a directory containing fastq files.

#This assumes you have already installed DLV's R packages ; if not, see the following: file:///Users/zachturpin/Desktop/SuppFile2_DNS_Pipeline.html

#alignment script assumes bt2 indices exist
