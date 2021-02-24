# Title: bash_commands

# Some useful snippets for Bash

## Environment Setup
### Loading files
  Untar file
  
  `tar -xvzf <FILE>.tar.gz`

### Install requirements

  `pip install -r requirements.txt`

### Directories
  Find files in current dir
  
  `find . -name <FILE>`

## EDA
  Check first 10 records
  
  `head -10 <FILE>`
  
  Count lines in every .txt file in current directory
  
  `echo $(wc -l  *.txt) `

## File manipulation

### Add scripts folder to environment path
  Run scripts saved in scripts folder directly from command line
  
  `export PATH=$PATH:/home/path/to/scripts
  SCRIPT_NAME.sh`

### Command on batch/multiple files
  Pipe input individually via xargs
  
  `find <FILE> | xargs [command] [-flags]`
  
  Convert reverse complement of index2 (I2) FASTQ files in a directory; add a prefix to their output FASTQ files.
  (in a .sh script)
  
  `#!/bin/bash \
  prefix="rev_comp_" \
  for f in *I2*; do seqkit seq -rp -t dna < "$f" > "$prefix$f"; done`
  
  Note: `gzip rev_comp*` files when done, in order for them to be processed in downstream pipelines.
  
## FASTA/FASTQ files
  See: https://anaconda.org/bioconda/seqkit for reference.
  
  Convert a gzipped FASTQ file to its reverse complement FASTQ:
  
  `
  seqkit seq -rp -t dna  SAMPLE.fastq.gz > rev_comp_SAMPLE.fastq  
  `
  
  gzip all FASTQs in current directory:
  
  ` 
  gzip *fastq
  `
  
  Find number of reads in fastq.gz:
  
  ``for i in `ls *.fastq.gz`; do echo $(zcat ${i} | wc -l)/4|bc; done``
  
  Drop ending extension. For instance, if a file is named fastq.gz, but it is not, in fact, gzipped.
  
  `rename 's/\.gz$//' *.gz`

 ## NGS packages
  Install python2.7 version of htseq
  
  `conda install -c bcbio htseq`

