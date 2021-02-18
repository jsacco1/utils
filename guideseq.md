#Guide-seq python2.7 setup and analysis

## Materials
  1. Demultiplexed fastq.gz files. Each sample should have R1, R2, I1, and I2 (reads 1 and 2, and indices 1 and 2).
  
## Environment setup
  1. Create python2.7 env

  `conda create -n py27 python=2.7`
  
  2. Install python2.7 version of htseq. (See: https://anaconda.org/bcbio/htseq)
  
  `conda install -c bcbio htseq`

## Analysis
  1. Run each step individually, starting from from umitag. No yaml file required. 
  
  Example:
  
  ` python2 guideseq/guideseq.py umitag --read1 path/to/r1 --read2 \
  path/to/r2 --index1 path/to/i1 --index2  path/to/r2 --outfolder  \
  path/to/output/ `

  2. Check first records of all fastq files
  
  `head -10 *fastq`
