#Guide-seq python2.7 setup and analysis

## Materials
  1. Demultiplexed fastq.gz files. Each sample should have R1, R2, I1, and I2 (reads 1 and 2, and index files 1 and 2).

  2. Human reference genome (hg38.fa)
  
## Environment setup
  1. Create python2.7 env

  `conda create -n py27 python=2.7`
  
  2. Install python2.7 version of htseq. (See: https://anaconda.org/bcbio/htseq)
  
  `conda install -c bcbio htseq`

  3. *May need bedtools 2.25 to work around some errors.*
  
  Download Bedtools 2.25 from here: https://github.com/arq5x/bedtools2/releases/tag/v2.25.0
  
  See this issue with regards to installation of bedtools and bwa: https://github.com/aryeelab/guideseq/blob/c608522e36dd20c480774284b52bcf13476a7b7b/.travis.yml
  
  Note the path for bwa added as environment variable.

  4. Add bwa and bedtools to the $PATH
  
## Analysis
  1. Run each step individually, starting from from umitag. No yaml file required. 
  
  Example:
  
  ` python2 guideseq/guideseq.py umitag --read1 path/to/r1 --read2 \
  path/to/r2 --index1 path/to/i1 --index2  path/to/r2 --outfolder  \
  path/to/output/ `

  2. Check first records of all fastq files
  
  `head -10 *fastq`

  3. Run consolidation step (may take 15-40 minutes)
  
  ` python2 guideseq/guideseq.py consolidate --read1 path/to/r1.umitagged --read2 \
  path/to/r2.umitagged --outfolder path/to/output/ `
  
  4. Align to reference genome.
  
  Make sure bwa is in your PATH. Specify path to genomic reference (e.g., hg38.fa).
  
  5. Identify off-target sites
  
  Use `''` to specify a control without a target sequence. Add the PAM sequence to the 3' (right side) of the target sequence argument. Append NGG for SpCas9, and NNGRRT for SaCas9.
  
  
