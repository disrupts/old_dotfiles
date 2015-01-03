#!/usr/bin/env zsh
# bootstrap.zsh at disrupts/dotfiles/bootstrap.zsh
# vim: nowrap fdm=marker

# Move to dotfiles folder ######### {{{1
cd "${0:A:h}"

# Set some functions ############## {{{1
function update_repo() {
  git pull origin master
  git submodule foreach git pull origin master
}
function reload_zsh() {
  source ~/.zshrc
  # src function is only avaible after sourcing .zshrc (.zshfn)
  # could check if `src` defined and then use it or sourcing .zshrc and exec src
}
function sync_dotfiles() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.zsh" \
        --exclude "README.md"  -av --no-perms . ~
}
function print_help() {
  echo "usage: bootstrap [--force][-f] [--update][-u] [--help][-h]"
  echo "  Options 'force' and 'update' are compatible."
}
function unset_functions() {
  unset ans
  unset flag
  unset sync_dotfiles
  unset reload_zsh
  unset sync_dotfiles
  unset print_help
  unset unset_functions
}

# Main stuff ###################### {{{1

local FLAG_FORCE=0
local FLAG_UPDATE=0
local FLAG_HELP=0

for flag in $argv; do
  case $flag in
  "--force" | "-f") FLAG_FORCE=1  ;;
  "--help"  | "-h") FLAG_HELP=1   ;;
  "--update"| "-u") FLAG_UPDATE=1 ;;
  *) ;;
  esac
done

if [[ $FLAG_HELP = 1 ]]; then
  print_help
  unset_functions
  exit 0
fi

if [[ $FLAG_UPDATE = 1 ]]; then
  echo "Updating dotfiles..."
  update_repo
fi

if [[ $FLAG_FORCE = 1 ]]; then
  echo "Forced dotfiles sync."
  sync_dotfiles
else
  echo "This may overwrite existing files in your home directory."
  echo "Are you sure? (y/n)"
  read -rs -k 1 ans
  case $ans in
  y|Y)  echo ; sync_dotfiles ;;
  *)    echo "Nothing done." ;;
  esac
fi

unset_functions
