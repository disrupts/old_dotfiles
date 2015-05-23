#!/usr/bin/env zsh
# bootstrap.zsh at disrupts/dotfiles/bootstrap.zsh
# vim: nowrap fdm=marker

# Move to dotfiles folder ######### {{{1
cd "${0:A:h}"

# Set some functions ############## {{{1
function update_repo() { git pull origin master && git submodule update --init }
function update_submodules() { git submodule foreach git pull origin master }
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
  echo "usage: bootstrap [--force][-f] [--help][-h]"
  echo "                 [--update-repo][-u] [--update-submodules][-s] [--update-all][-U]"
  echo "  Options '--update-all' is equivalent to '--update-repo --update-submodules'."
  echo "  Options '--force' is compatible with updates."
  echo "  Joined arguments (eg: "-Uf") may be used."
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
local FLAG_UPDATE_REPO=0
local FLAG_UPDATE_MODULES=0
local FLAG_HELP=0

for flag in $argv; do # $* is an alternate form of $argv
  case $flag in
  # checks for separate arguments
  "--force"             | "-f") FLAG_FORCE=1                              ;;
  "--help"              | "-h") FLAG_HELP=1                               ;;
  "--update-submodules" | "-s") FLAG_UPDATE_MODULES=1                     ;;
  "--update-repo"       | "-u") FLAG_UPDATE_REPO=1                        ;;
  "--update-all"        | "-U") FLAG_UPDATE_MODULES=1; FLAG_UPDATE_REPO=1 ;;
  # checks for combined arguments
  "-us" | "-su" | "-usU" | "-uUs" | "-suU" | "-sUu" | "-Usu" | "-Uus")
    FLAG_UPDATE_MODULES=1
    FLAG_UPDATE_REPO=1
    ;;
  "-fU" | "-Uf" | "-fus" | "-fsu" | "-usf" | "-ufs" | "-sfu" | "-suf")
    FLAG_UPDATE_REPO=1
    FLAG_UPDATE_MODULES=1
    FLAG_FORCE=1
    ;;
  "-sf" | "-fs")
    FLAG_UPDATE_MODULES=1
    FLAG_FORCE=1
    ;;
  "-fu" | "uf")
    FLAG_UPDATE_REPO=1
    FLAG_FORCE=1
    ;;
  esac
done
# if no flag is set and $1 != "" then wrong argument written
if [[ ($#>0) && ($FLAG_FORCE==0) && ($FLAG_UPDATE_REPO==0) &&
      ($FLAG_UPDATE_MODULES==0) ]]; then
  FLAG_HELP=1
fi

if [[ $FLAG_HELP == 1 ]]; then
  print_help
  unset_functions
  exit 0
fi

if [[ $FLAG_UPDATE_REPO == 1 ]]; then
  echo "Updating dotfiles..."
  update_repo
fi
if [[ $FLAG_UPDATE_MODULES == 1 ]]; then
  echo "Updating git submodules..."
  update_submodules
fi

if [[ $FLAG_FORCE == 1 ]]; then
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
