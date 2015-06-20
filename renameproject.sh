#!/usr/bin/env bash

if [ $# -eq 0 ]; then
echo "Usage: renameproject.sh newname";
exit 1;
fi

rm -rf .git
rm -f fnr.exe renameproject.bat
# Removing FD files, only needed on windows
rm -f fdrun.bat nodeproject.hxproj

for f in nodeproject.*; do mv $f $(echo $f | sed "s/^nodeproject/$1/g"); done

find . ! -name "renameproject.sh" -type f -exec sed -i -e "s/nodeproject/$1/g" {} \;

rm -- "$0"
