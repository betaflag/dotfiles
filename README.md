# Dotfiles

Inspired from https://github.com/mathiasbynens/dotfiles

## Install XCode CLI Tools

xcode-select —-install

## Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install oh-my-zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Copy dotfiles in your home

```
cp ./home/* ~
```

## Add exports to .zshrc

```
echo "source .exports" >> .zshrc
```
