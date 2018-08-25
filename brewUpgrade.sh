#!/bin/bash

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log

echo "update mas..."
mas upgrade

echo "update brew..."
brew upgrade

echo "installed mas list"
mas list

echo "installed brew list..."
brew ls

echo "installed brew cask list..."
brew cask ls

echo "brew cleanup..."
brew cleanup -s
