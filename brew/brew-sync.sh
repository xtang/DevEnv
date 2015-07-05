#!/bin/bash
 
# Sync Homebrew installations between Macs via Dropbox
#
 
BREW="/usr/local/bin/brew"
 
# first get local settings
echo "Reading local settings ..."
rm -f /tmp/brew-sync.*
$BREW tap > /tmp/brew-sync.taps
$BREW list > /tmp/brew-sync.installed
 
# then combine it with list in Dropbox
echo "Reading settings from Dropbox ..."
[ -e ~/Dropbox/Homebrew/brew-sync.taps ] && cat ~/Dropbox/Homebrew/brew-sync.taps >> /tmp/brew-sync.taps
[ -e ~/Dropbox/Homebrew/brew-sync.installed ] && cat ~/Dropbox/Homebrew/brew-sync.installed >> /tmp/brew-sync.installed
 
# make the lists unique and sync into Dropbox
echo "Syncing to Dropbox ..."
mkdir -p ~/Dropbox/Apps/Homebrew
cat /tmp/brew-sync.taps | sort | uniq > ~/Dropbox/Homebrew/brew-sync.taps
cat /tmp/brew-sync.installed | sort | uniq > ~/Dropbox/Homebrew/brew-sync.installed
 
# Set taps
echo "Enabling taps ..."
for TAP in `cat ~/Dropbox/Homebrew/brew-sync.taps`; do
	$BREW tap ${TAP} >/dev/null
done
 
# Install missing Homebrew packages
echo "Install missing packages ..."
for PACKAGE in `cat ~/Dropbox/Homebrew/brew-sync.installed`; do
	$BREW list ${PACKAGE} >/dev/null
	[ "$?" != "0" ] && $BREW install ${PACKAGE}
done
