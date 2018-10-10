#!/bin/bash

#   Mac OSX >= 10.9  bootstrap / quicksetup script.
#
#   Installs homebrew, and uses brew to install vim, python, and other basic components specifically for OSX.
#
##  NOTE: Make sure you FIRST install the Xcode Command Line Tools for Mac OSX-
##        For OSX 10.9 and newer: simply run `xcode-select --install` from the terminal
##        For OSX 10.8 and older: Install gcc with homebrew by using the apple-gcc42 package from homebrew/dupes

echo "This script will install homebrew/cask and other basic components, and although idempotent, is intended to be run on new Mac OSX environments."

read -p "WARNING!! ~ For OSX 10.9 and newer make sure you have installed Xcode or Command Line Tools first (xcode-select --install) before running this script for the first time. On older machines, seek assistance. Are you sure you wish to continue setup?" -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  clear
  echo "Now executing script!"

  # Checks for homebrew, and installs if not found
  echo "Checking for homebrew..."
  if test ! $(which brew); then
    echo "homebrew package manager not found! Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "homebrew is already installed! Skipping..."
  fi

  # Updates brew formulae/packages
  echo "Updating brew formulaes..."
  brew update

  # Installs GNU utilities
  echo "Installing GNU coreutils..."
  brew install coreutils
  brew install gnu-sed --with-default-names
  brew install gnu-tar --with-default-names
  brew install gnu-indent --with-default-names
  brew install gnu-which --with-default-names

  # Installs GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
  echo "Installing GNU findutils..."
  brew install findutils

  # Installs Bash 4
  echo "Installing Bash v4..."
  brew install bash

  # Defines brew packages for install
  PACKAGES=(
      ack
      autoconf
      automake
      boot2docker
      ffmpeg
      gifsicle
      git
      graphviz
      gst-plugins-base
      gst-plugins-good
      gstreamer
      libjpeg
      libmemcached
      markdown
      memcached
      mongodb
      npm
      pkg-config
      postgresql
      python
      rename
      ssh-copy-id
      tmux
      tree
      vim
      wget
  )

  # Installs the defined packages
  echo "Installing brew packages..."
  brew install ${PACKAGES[@]}

  # Cleans up homebrew after package installs
  echo "Cleaning up homebrew..."
  brew cleanup

  # Installs homebrew's cask for MacOSX apps
  echo "Installing cask..."
  brew tap caskroom/cask

  # Use cask to install extra fonts
  echo "Installing extra fonts..."
  brew tap caskroom/fonts
  FONTS=(
      font-roboto-mono
  )
  brew cask install ${FONTS[@]}

  # Installs global python packages
  echo "Installing Python3 packages..."
  PYTHON_PACKAGES=(
      pipenv
  )
  pip3 install ${PYTHON_PACKAGES[@]}

  # Installs global npm packages
  echo "Installing global Node Package Manager packages..."
  npm install marked -g

  # Runs OSX hacks / configs
  echo "Now configuring custom OSX preferences..."

  # Set fast key repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 0

  # Require password as soon as screensaver or sleep mode starts
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # Show filename extensions by default
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Refresh terminal session without quitting terminal
  hash -r

  echo "OSX setup script complete!"

else # Quits script if anything other than y|Y is input at prompt
  echo "Exiting script! (no changes made)"
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi
