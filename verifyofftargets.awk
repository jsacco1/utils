verifyofftargets.awk
BEGIN {awk -F "," 'NR&gt;1'} {print $#whatever number column I is}

#https://stackoverflow.com/questions/17001849/awk-partly-string-match-if-column-word-partly-matches#17001897