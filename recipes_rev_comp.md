# Title: Reverse complement fastq.gz files

## Description: Convert a gzipped fastq file to its reverse complement

## Dependencies: 
  seqkit (bioconda package)
  
  *Recommend installation in a conda environment*

## Usage example

  `seqkit seq -rp -t dna SAMPLE.fastq.gz > rev_comp_SAMPLE.fastq`
  
## Recipe: Convert whole fastq.gz files to their reverse complements in batch

  1. Open the bash shell and activate conda env with seqkit installed.
  
  2. Copy and paste all Index2 files to their own directory, within the current directory of fastq files.
  
  `mkdir I2`
  
  `cp - r *I2* I2/`

  3. Set prefix for reverse complement files.
  
  `prefix=rev_comp_`
  
  4. Assign all fastq files to a variable.
  
  `files=$(ls *fastq.gz)`
  
  5. Batch reverse complement.
  
  `for f in $files; do seqkit seq -rp -t dna < "$f" > "$prefix$f"; done`
  
  6. Drop ending extension. The FASTQ files end with "fastq.gz", but are not, in fact, gzipped.

  `rename 's/\.gz$//' rev*`
  
  7. Gzip all FASTQs in current directory (do this after making reverse complement files):

  `gzip *fastq`

## Sanity check

  1. Find number of reads in fastq.gz files

  `for i in ``ls *.fastq.gz`` do echo $(zcat ${i} | wc -l)/4|bc; done`


References:

https://anaconda.org/bioconda/seqkit
