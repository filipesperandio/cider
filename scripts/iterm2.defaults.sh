#!/usr/bin/env bash

# To export
# defaults export ~/Library/Preferences/com.googlecode.iterm2.plist ./iterm.plist

defaults import ~/Library/Preferences/com.googlecode.iterm2.plist $(dirname ${BASH_SOURCE[0]})/iterm.plist
