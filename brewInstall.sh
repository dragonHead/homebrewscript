#!/bin/bash

#github
#https://github.com/Homebrew

#memo
#Install Xcode and Command Line Tools for Xcode before installing

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log
exec > >(tee ${LOG_FILE}) 2>&1

echo "Create log directory"
mkdir -p ${LOG_DIR}

echo "Installing brew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew config"
brew config

echo "brew doctor..."
if brew doctor > /dev/null; then
  #application install
  brew bundle
fi

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

#echo "create Brewfile"
#brew bundle dump

exit
