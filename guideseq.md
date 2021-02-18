#Guide-seq python2.7 setup and analysis

## Materials
  1. Demultiplexed fastq.gz files with r1, r2, i1, i2.

## Environment setup
  1. Create python2.7 env

  `conda create -n py27 python=2.7`
  
  2. Install python2.7 version of htseq
  
  `conda install -c bcbio htseq`

## Analysis
  1. Run each step individually from umitag
  
  Example:
  
  ` python2 guideseq/guideseq.py umitag --read1 path/to/r1 --read2 \
  path/to/r2 --index1 path/to/i1 --index2  path/to/r2 --outfolder  \
  path/to/output/ `

  2. Check fastq records
  
  `head -10 *fastq`
