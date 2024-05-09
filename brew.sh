#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names


# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

brew install wget --with-iri
brew install gnupg
brew install vim --with-override-system-vi
brew install grep

brew install ffmpeg
brew install ansible
brew install curl
brew install terraform


brew install --cask 1password-cli
brew install --cask ngrok
brew install --cask wireshark
brew install --cask virtualbox
brew install --cask firefox@developer-edition
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask iterm2

# Remove outdated versions from the cellar.
brew cleanup
