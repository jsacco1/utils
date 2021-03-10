verifyofftargets.awk
# column I ("Sequence") is the 9th column in identifyofftargets.txt
BEGIN {awk -F "," 'NR&gt;1'} {print $9}

#https://stackoverflow.com/questions/17001849/awk-partly-string-match-if-column-word-partly-matches#17001897

# awk '{for(i=1; i<=NF; i++) file

# awk 'NR==FNR{a[$9];next}' file1.txt file2.txt

