#!/bin/bash

FILE=/etc/group

grep -v '^#' $FILE | cut -f3 -d":" | sort -n | uniq -d | while read DUPE ; do
  groups=`awk -F: '($3 == n) { print $1 }' n=$DUPE $FILE`
  echo "Duplicate GID ($DUPE): ${groups}"
done
