#!/bin/bash

set -e

echo "Installing Anka Scan..."

FULL_FILE_NAME=$(echo $(curl -Ls -r 0-1 -o /dev/null -w %{url_effective} https://veertu.com/downloads/runtime-mac-scan) | cut -d/ -f5)
PARTIAL_FILE_NAME=$(echo $FULL_FILE_NAME | awk -F'.zip' '{print $1}')
curl -Ls https://veertu.com/downloads/runtime-mac-scan -o $FULL_FILE_NAME
unzip $FULL_FILE_NAME
rm -f $FULL_FILE_NAME

cd $PARTIAL_FILE_NAME

./runtime-mac-scan-cli stop

./runtime-mac-scan-cli report
