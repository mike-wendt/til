#!/bin/bash

TGTDIR=${1:-.}

# Sync changes made in core files to this directory
mkdir -p ${TGTDIR}
rsync -aPh ~/.zshrc ~/.zprofile ~/.vimrc ~/.p10k.zsh ~/.gitconfig ~/.gitignore_global ${TGTDIR}
