#!/usr/bin/env bash
set -eu

log () {
  local fmt="» $1\n"; shift;
  tput setaf 2; printf "\n$fmt" "$@"; tput sgr0;
}

# ------------------------------------------------------------------------------

log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s
