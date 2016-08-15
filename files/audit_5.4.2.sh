#!/bin/bash

for user in `awk -F: '($3 < 500) {print $1 }' /etc/passwd`; do
  if [ $user != "root" ]; then
    usermod -L $user
    if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]; then
      usermod -s /sbin/nologin $user
    fi
  fi
done
