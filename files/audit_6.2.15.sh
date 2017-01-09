#!/bin/bash
 
comm -23 <(cut -s -d: -f4 /etc/passwd | sort -u) <(cut -s -d: -f3 /etc/group | sort -u) | while read GROUP ; do
  echo "Group $GROUP is referenced by /etc/passwd but does not exist in /etc/group"
done
