#!/bin/bash

out=$(ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{
print $NF }')
if [[ $out ]]; then
  echo "Investigate the unconfined daemons found during the audit action"
  echo $out
fi
