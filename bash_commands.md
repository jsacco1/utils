-Title: bash_commands

#Some useful snippets for Bash

## Loading files
1. Untar file
`tar -xvzf <FILE>.tar.gz`

## Install requirements
`pip install -r requirements.txt`

## Directories
Find files
`find . -name <FILE>`

## Preview Files
`head -10 <FILE>`

## Command on batch/multiple files
`find <FILE> | xargs [command] [-flags]`

## Find number of reads in fastq.gz
`for i in `ls *.fastq.gz`; do echo $(zcat ${i} | wc -l)/4|bc; done`




