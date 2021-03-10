# Title: bash_commands

# Some useful snippets for Bash

## Environment Setup

### Copy and send file over a secure, encrypted network connection
  Use Linux scp command:
  `scp [File] user@host:/[dir]`

### Activate conda
  If conda is already in bashrc, make sure conda is installed. Find `~/anaconda3/bin/`
  
   `source ~/anaconda3/bin/activate`
   
  Conda init
  
   `conda init`
   

### Memory resources
  Check if you have enough memory to run intensive processes, such as creating SAM files. Notice swap memory. In bioinformatics, one should have about 16GB of memory.
  
  `top`
  
  A good check is to run bwa mem with forward and reverse FASTQ files. If memory runs out, the system will automatically kill the process. 
  
  Adjust swapiness value if you run out of memory on a Linux system.(See: https://linuxize.com/post/create-a-linux-swap-file/)

### Loading files
  Untar file
  
  `tar -xvzf <FILE>.tar.gz`

### Install requirements

  `pip install -r requirements.txt`

### Directories
  Find files in current dir
  
  `find . -name <FILE>`
  
  Enter a directory with spaces in its name
  
  `cd 'path/to/di rectory'`

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
  Pipe input individually via xargs. Syntax: 
  
  `find <FILE> | xargs [command] [-flags]`
  
  ### Convert reverse complement of index2 (I2) FASTQ files in a directory.
  Add a prefix to their output FASTQ files.
  (in a .sh script)
  
  `#!/bin/bash \
  prefix="rev_comp_" \
  for f in *I2*; do seqkit seq -rp -t dna < "$f" > "$prefix$f"; done`
  
  Note: `gzip rev_comp*` files when done, in order for them to be processed in downstream pipelines.
  
  ### Alternatively, in the command prompt:
  
  1. Select all fastq.gz files in current directory.
  
  `files=$(ls *fastq.gz)`
  
  2. Set a prefix.

  `prefix=rev_comp`
  
  3. Check the variable was assigned.

  `echo $prefix`
  
  4. Run command on all files in files, and append prefix to output file names.

  `for f in $files; do seqkit seq -rp -t dna < "$f" > "$prefix$f"; done`
  
  5. Remove all original files without the prefix
  
  `rm  -- !(rev_comp*)`
  
## FASTA/FASTQ files
  See: https://anaconda.org/bioconda/seqkit for reference.
  
  Convert a gzipped FASTQ file to its reverse complement FASTQ:
  
  `
  seqkit seq -rp -t dna  SAMPLE.fastq.gz > rev_comp_SAMPLE.fastq  
  `
  
  gzip all FASTQs in current directory (do this after making reverse complement files):
  
  ` 
  gzip *fastq
  `
  
  Find number of reads in fastq.gz:
  
  ``for i in `/ls *.fastq.gz`/; do echo $(zcat ${i} | wc -l)/4|bc; done``
  
  Drop ending extension. For instance, if a file is named fastq.gz, but it is not, in fact, gzipped.
  
  `rename 's/\.gz$//' *.gz`

  Save the read counts of all the fastq.gz files in the current directory to a csv. This saves the filenames and read counts in the same column. 
  
  `for i in `ls *.fastq.gz`; do echo $(zcat ${i} | wc -l)/4|bc; echo ${i}; done > read_counts_MMDDYYYY.csv`

 ## NGS packages
  Install python2.7 version of htseq
  
  `conda install -c bcbio htseq`
  
  Check if tools such as bwa, bedtools, and samtools are installed in your path.
 
  

