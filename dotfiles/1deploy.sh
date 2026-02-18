#!/bin/bash

function logger {
  echo -e ">>>>\n>>>>${1}\n>>>>"
}

# Deploy these dotfiles and ZSH config to current computer
function deploy {
  TS=`date +%Y%m%d-%H%M%S`
  BKDIR="backups/${TS}"
  logger "Backing up current config to $BKDIR"
  ./0sync.sh $BKDIR
  logger "Deploying dotfiles to ~"
  rsync -aPh .zshrc .zprofile .vimrc .p10k.zsh .gitconfig .gitignore_global ~
  logger "Deployment complete"
  logger "WARNING: Verify username matches current system '$USER'"
  logger "Installing antigen..."
  curl -L git.io/antigen > ~/antigen.zsh
  logger "Run 'omz reload' to update OMZ and activate antigen"
  logger "Go to https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#fonts to install fonts"
  exit
}

# Check that we want to overwrite, always backup first
echo "Are you sure you want to deploy these files over the existing install?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) deploy;;
    No ) exit;;
  esac
done
