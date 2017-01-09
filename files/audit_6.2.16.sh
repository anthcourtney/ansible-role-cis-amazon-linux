#!/bin/bash

FILE=/etc/passwd

grep -v '^#' $FILE | cut -f3 -d":" | sort -n | uniq -d | while read DUPE ; do
  users=`awk -F: '($3 == n) { print $1 }' n="$DUPE" $FILE`
  echo "Duplicate UID ($DUPE): ${users}"
done
