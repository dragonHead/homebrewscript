#!/bin/bash

#https://github.com/Homebrew

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log


echo "Create log directory"
mkdir -p ${LOG_DIR}

echo "Installing brew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew doctor..."
if brew doctor > /dev/null; then
  brew bundle ${HOME_DIR}/Brewfile
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

echo "brew cask cleanup..."
brew cask cleanup

#echo "create Brewfile"
#brew bundle dump

exit
