#!/bin/bash

#linuxbrew
#https://docs.brew.sh/Homebrew-on-Linux

#before execution
#pass=
#echo $pass | sudo apt-get install build-essential curl file git

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}_`date +%Y%m%d%H%M%S`.log
exec > >(tee ${LOG_FILE}) 2>&1

echo "Create log directory..."
mkdir -p ${LOG_DIR}

echo "Installing brew..."
which brew >/dev/null 2>&1 || sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
source ~/.bash_profile
source ~/.profile

echo "brew config..."
brew config

echo "brew doctor..."
if brew doctor > /dev/null; then
  #application install
  brew bundle
fi

echo "update brew..."
brew update
brew upgrade

echo "installed brew list..."
brew ls

echo "brew cleanup..."
brew cleanup -s

#echo "create Brewfile"
#brew bundle dump

exit
