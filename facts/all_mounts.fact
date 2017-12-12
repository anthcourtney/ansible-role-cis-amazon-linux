#!/usr/bin/python

##
# all_mounts.fact
# This is a custom fact that will gather all
# mounts into a fact, ansible_mounts will only
# get mounts that are tied to a physical device
# that will leave out many mounts
##

import os
import json

##
# get_file_content
# gets the content of a file
# path - the path to the file
# default - the default return
# strip - strip out whitespace
##
def get_file_content(path, default=None, strip=True):
    data = default
    if os.path.exists(path) and os.access(path, os.R_OK):
        try:
            try:
                datafile = open(path)
                data = datafile.read()
                if strip:
                    data = data.strip()
                if len(data) == 0:
                    data = default
            finally:
                datafile.close()
        except:
            pass
    return data

##
# get_mtab_entries
# gets the mtab entries to use
##
def get_mtab_entries():

    mtab_file = '/etc/mtab'
    if not os.path.exists(mtab_file):
        mtab_file = '/proc/mounts'

    mtab = get_file_content(mtab_file, '')
    mtab_entries = []
    for line in mtab.splitlines():
        fields = line.split()
        if len(fields) < 4:
            continue
        mtab_entries.append(fields)
    return mtab_entries

## Main ##

mtab_entries = get_mtab_entries()

mounts = []

for fields in mtab_entries:
    device, mount, fstype, options = fields[0], fields[1], fields[2], fields[3]

    mount_info = {
        'mount': mount,
        'device': device,
        'fstype': fstype,
        'options': options
    }

    mounts.append(mount_info)

print json.dumps(mounts)
