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
  rsync -aPh --exclude={'0sync.sh','1deploy.sh','backups'} ./* ~
  logger "Deployment complete"
  exit
}

# Check that we want to overrite, always backup first
echo "Are you sure you want to deploy these files over the exisiting install?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) deploy;;
    No ) exit;;
  esac
done
