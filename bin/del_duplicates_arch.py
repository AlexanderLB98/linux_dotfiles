#!/usr/bin/env python

import datetime
import os
import re

d = "/var/lib/pacman/local"

packages = os.listdir(d)
packages.sort()
packages.remove("ALPM_DB_VERSION")

pkgname_search = re.compile("^(.*?)-[0-9]")

old_packages = []

for pkg1 in packages:
    if pkg1 in old_packages:
        continue

    # get package name
    matches = pkgname_search.findall(pkg1)
    print(pkg1)
    if matches == []:
        continue
    pkgname = matches[0]

    # look for other items with the same package name
    for pkg2 in packages:
        if pkg2 == pkg1:
            continue
        if pkg2 in old_packages:
            continue
        if pkgname == pkgname_search.findall(pkg2)[0]:
            # We now have two duplicate packages, we want to delete the old one

            old_package = pkg1
            path1 = os.path.join(d, pkg1)
            path2 = os.path.join(d, pkg2)

            # Check if both files exist before comparing their modification time
            if os.path.exists(path1) and os.path.exists(path2):
                if os.stat(path1).st_mtime > os.stat(path2).st_mtime:
                    old_package = pkg2

                old_packages.append(old_package)

                oldpath = os.path.join(d, old_package)
                target = os.path.join("/var/lib/pacman/OLD", old_package)

                # Check if the oldpath exists before moving the file
                if os.path.exists(oldpath):
                    cmd = f'mv "{oldpath}" "{target}"'
                    print(cmd)
                    os.system(cmd)
                else:
                    print(f"Warning: The path {oldpath} does not exist. Skipping move.")
            else:
                print(f"Error: One of the files {path1} or {path2} does not exist.")
