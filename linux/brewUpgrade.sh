#!/bin/bash

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log
exec > >(tee ${LOG_FILE}) 2>&1

echo "start update."

echo "brew -v..."
brew -v

echo "brew doctor..."
brew doctor

echo "update brew..."
brew outdated
brew update
brew upgrade

echo "installed brew list..."
brew ls

echo "brew cleanup..."
brew cleanup -s

echo "log cleanup..."
find ${LOG_DIR} -mtime +5 -exec rm -f {} \;

echo "update end."
exit