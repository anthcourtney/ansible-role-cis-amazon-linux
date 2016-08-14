#!/bin/bash

for dir in `cat /etc/passwd |\
  awk -F: '{ print $6 }'`; do
  if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; then
    echo ".netrc file $dir/.netrc exists"
  fi
done
