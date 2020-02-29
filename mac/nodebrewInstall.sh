#!/bin/zsh

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log
exec > >(tee ${LOG_FILE}) 2>&1

#https://github.com/hokaccha/nodebrew
curl -L git.io/nodebrew | perl - setup
echo "export PATH=\$HOME/.nodebrew/current/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc

exit
