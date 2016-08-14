#!/bin/bash

for dir in `cat /etc/passwd |\
  awk -F: '{ print $6 }'`; do
  if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then
    echo ".forward file $dir/.forward exists"
  fi
done
