#!/usr/bin/env bash
set -e

start_on_login() {
  local app=$1
  local location=$(app_path $app)
  local name=$(app_name $app)
  local final_location=$([[ -n $name ]] && echo $location || app_from_application $app)

  osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"${final_location}\", name:\"${app}\", hidden: true}"
}

delete_all_login_items() {
  for item in $(all_items)
  do
    osascript -e "tell application \"System Events\" to delete login item \"${item}\"" 
  done
}

all_items() {
  osascript -e 'tell application "System Events" to get the name of every login item' | tr ',' ' '
}

app_name() {
  local app=$1
  brew cask info  $app | grep '(app)' | awk '{print $1}'
}

app_from_application() {
  local lookup_dir=/Applications
  local app_name=$(ls $lookup_dir | grep -i $1)
  echo "${lookup_dir}/${app_name}"
}

app_path() {
  local app=$1
  local dir=$(brew cask info $app | awk 'NR==4' | awk '{print $1}')
  local app_name=$(app_name $app)
  echo "${dir}/${app_name}"
}

delete_all_login_items

start_on_login dropbox
start_on_login spectacle
start_on_login caffeine
start_on_login karabiner
