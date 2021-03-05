# Title: Reverse complement fastq.gz files

## Description: Convert a gzipped FASTQ file to its reverse complement FASTQ:

## Dependencies: seqkit (bioconda package)

## Usage example

  `seqkit seq -rp -t dna SAMPLE.fastq.gz > rev_comp_SAMPLE.fastq`
  
## Recipe: Convert whole fastq.gz files to their reverse complements in batch
  
  Copy and paste all Index2 files to their own directory, within the current directory of fastq files.
  
  `mkdir I2`
  
  `cp - r *I2* I2/`

  Set prefix for reverse complement files.
  
  `prefix=rev_comp_`
  
  Assign all fastq files to a variable.
  
  `files=$(ls *fastq.gz)`
  
  Batch reverse complement.
  
  `for f in $files; do seqkit seq -rp -t dna < "$prefix$f" > "$prefix$f"; done`
  
  Drop ending extension. The FASTQ files end with "fastq.gz", but are not, in fact, gzipped.

  `rename 's/\.gz$//' *.gz`
  
  Gzip all FASTQs in current directory (do this after making reverse complement files):

  `gzip *fastq`

## EDA

  Find number of reads in fastq.gz files

  `for i in ``ls *.fastq.gz`` do echo $(zcat ${i} | wc -l)/4|bc; done`


Reference:

See: https://anaconda.org/bioconda/seqkit for reference.
