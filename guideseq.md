#Guide-seq python2.7 setup and run analysis

## Materials
  1. demultiplexed fastq.gz files with r1, r2, i1, i2.

## Environment setup
  1. create python2.7 env

  `conda create -n py27 python=2.7`

## Analysis
  1. Run each step individually from umitag
  Example:
  ` python2 guideseq/guideseq.py umitag --read1 path/to/r1 --read2 \
  path/to/r2 --index1 path/to/i1 --index2  path/to/r2 --outfolder  \
  path/to/output/ `

