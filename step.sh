#!/bin/bash

set -e

if [[ -z "${DEPLOY_ENV}" ]]; then
  echo "Stopping Anka Scan and Generating Report..."

  cd $PARTIAL_FILE_NAME

  ./runtime-mac-scan-cli stop

  ./runtime-mac-scan-cli report
else
  echo "Make sure to run Anka Scan Start before running Anka Scan Stop"
  exit 1
fi
