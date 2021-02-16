# Title: bash_commands

# Some useful snippets for Bash

## Environment Setup
### Loading files
1. Untar file
  `tar -xvzf <FILE>.tar.gz`

### Install requirements
  `pip install -r requirements.txt`

### Directories
  Find files in current dir
  `find . -name <FILE>`

## EDA
  Check first 10 records
  `head -10 <FILE>`

## File manipulation
### Command on batch/multiple files
  `find <FILE> | xargs [command] [-flags]`

## FASTA/FASTQ files
  See: https://anaconda.org/bioconda/seqkit for reference.
  This command converts a gzipped FASTQ file to its reverse complement FASTQ
  `
  seqkit seq -rp -t dna  SAMPLE.fastq.gz > rev_comp_SAMPLE.fastq  
  `
  gzip FASTQs captured with the wildcard
  ` gzip *fastq`
  
  Find number of reads in fastq.gz
  `for i in `ls *.fastq.gz`; do echo $(zcat ${i} | wc -l)/4|bc; done`



