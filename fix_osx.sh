#!/bin/bash
#Largely taken from https://github.com/lxcode/dotfiles/blob/master/fix_osx.sh

# Use autohide but make it quick
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.17
# On second thought, let's make it fast to animate but hard to trigger
defaults write com.apple.dock autohide-delay -int 0

# ANIMATE MORE FASTER
defaults write NSGlobalDomain NSWindowResizeTime .1

# By default, you can't type things like "GAAAAAAAAAAAH". Unacceptable.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# This is not an iPad.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable drop shadow on screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# I do not need my documents to be cloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Check for updates daily.
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# It's my library. Let me see it.
chflags nohidden ~/Library/
sudo chflags nohidden /tmp
sudo chflags nohidden /usr
