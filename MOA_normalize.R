#!/usr/bin/env Rscript
#ZMT_090718_UNTESTED
#this script finishes DLV's pipeline
#load libraries, set options, and toplevel chromsizes for alignment.
library(travis)
options(threads=8)
options(verbose=T)
#set path to chromsizes_chr
chromsizes_chr=files("INSERT_PATH_TO_CHROMSIZES_CHR")
bedSort(chromsizes_chr)
#convert bam to fragment bed files
bams=files("*all.bam")
beds=bamToBed(bams,paired=T)
#parse by length (all vs 00-80)
#bpl=bedParseLengths(beds,c(0,80))
#bpl=unlist(bpl)
#calculate fragment densities
#allbeds=files("*.bed")
#bgs=bedtoolsGenomeCov(allbeds,chromsizes_chr)
#unify bedgraphs to same coordinates
#ubgs=bgUnify(bgs,filler=0,discardUnshared=F)
#Make coverage files in 20 bp windows
allbeds=files("*.bed")
w=bedtoolsMakeWindows(chromsizes_chr,20,genome=T)
bgs=bedtoolsCoverage(allbeds,w)
bgs=files("*w20.bg")
#for each subclass of fragment size, perform quantile normalization across all samples
#smallfrags=files("*00-80*w20.bg")
#allfrags=files("nSort_B73v4*w20.bg")
#qbgs_smallfrags=bgQuantileNorm(smallfrags)
#qbgs_allfrags=bgQuantileNorm(allfrags)
#convert bedGraph files to bigWigs
#all_qbgs=files("*.qnorm.bg")
bws=bedGraphToBigWig(bgs,chromsizes_chr)
