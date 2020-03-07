#!/bin/bash

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log
exec > >(tee ${LOG_FILE}) 2>&1

echo "Create log directory..."
mkdir -p ${LOG_DIR}

PASS=
echo $PASS | sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo $PASS | sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo $PASS | sudo apt-get update
echo $PASS | sudo apt-get install -y google-chrome-stable

exit
