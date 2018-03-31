#!/bin/bash

echo "Installing brew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

masInstallList=(
  1013592989
  443987910
  413215883
  497799835
  441258766
)

brewInstallList=(
  git
  mas
  openssl
  socat
  docker
)

brewCaskInstallList=(
  atom
  google-japanese-ime
  caffeine
  appcleaner
  docker
  google-chrome
  gimp
  duet
  caffeine
  xquartz
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

#echo "brew doctor..."
#if brew doctor > /dev/null; then
  echo "ok!"

  for masInstallItem in "${masInstallList[@]}"; do
    masInstall $masInstallItem
  done

  for brewInstallItem in "${brewInstallList[@]}"; do
    brewInstall $brewInstallItem
  done

  for brewCaskInstallItem in "${brewCaskInstallList[@]}"; do
    brewCaskInstall $brewCaskInstallItem
  done

#fi

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

echo "brew cask cleanup"
brew cask cleanup

exit
