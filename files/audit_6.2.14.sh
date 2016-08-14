#!/bin/bash

for dir in `cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do
  for file in $dir/.rhosts; do
    if [ ! -h "$file" -a -f "$file" ]; then
      echo ".rhosts file in $dir"
    fi
  done
done
