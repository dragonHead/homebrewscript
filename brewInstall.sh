#!/bin/bash

HOME_DIR=$(cd $(dirname $0) && pwd)
FILE_NAME=$(basename $0 .sh)

LOG_DIR=${HOME_DIR}/log
LOG_FILE=${LOG_DIR}/${FILE_NAME}`date +%Y%m%d%H%M%S`.log

mkdir -p ${LOG_DIR}

brewInstallList=(
  git
  mas
  openssl
  socat
  docker
)

brewCaskInstallList=(
  appcleaner
  atom
  caffeine
  docker
  google-chrome
  google-japanese-ime
  kindle
  xquartz
)

masInstallList=(
  1013592989
  443987910
  497799835
  441258766
)

function masInstall() {
  if mas install $1 > /dev/null; then
    echo "installed $1 "
  else
    echo "install $1 ..."
    mas install $1
  fi
}

function brewInstall() {
  if brew ls --versions $1 2> /dev/null; then
    echo "installed $1"
  else
    echo "install $1"
    brew install $1
  fi
}

function brewCaskInstall() {
  if brew cask ls --versions $1 2> /dev/null; then
    echo "installed $1"
  else
    echo "install $1"
    brew cask install $1
  fi
}

echo "Installing brew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew doctor..."
if brew doctor > /dev/null; then
  echo "ok!"

  for brewInstallItem in "${brewInstallList[@]}"; do
    brewInstall $brewInstallItem
  done

  for brewCaskInstallItem in "${brewCaskInstallList[@]}"; do
    brewCaskInstall $brewCaskInstallItem
  done

  for masInstallItem in "${masInstallList[@]}"; do
    masInstall $masInstallItem
  done

fi

echo
echo "update mas..."
mas upgrade

echo "###############################################"
echo

echo "update brew..."
brew upgrade

echo "###############################################"
echo

echo "installed mas list"
mas list

echo "###############################################"
echo

echo "installed brew list..."
brew ls

echo "###############################################"
echo

echo "installed brew cask list..."
brew cask ls

echo "###############################################"
echo

echo "brew cleanup..."
brew cleanup -s

echo "###############################################"
echo

echo "brew cask cleanup"
brew cask cleanup

echo "###############################################"
echo

exit
