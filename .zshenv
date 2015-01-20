# zshenv at $HOME/.zshenv #########
# vim: nowrap fdm=marker

# Locale is not set in Mac OS X ### {{{1
export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
#export LANG=en_GB.UTF-8
#export LANGUAGE=eng_GB.UTF-8

# ZSH configuration ############### {{{1
# zsh history ##################### {{{2
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Setting default apps ############ {{{1
export EDITOR="vim"
export BROWSER="firefox"

# Setting PATH #################### {{{1
# PATH Elements ################### {{{2
local MAC_HOMESCRIPTS="/Users/$USER/.bin_scripts"
local MAC_BASIC="/usr/bin:/usr/sbin:/bin:/sbin"
local MAC_RUBIES="/usr/local/opt/ruby/bin"          # brew ruby gems
local MAC_LATEX="/usr/texbin"                       # brew latex
local MAC_BREW="/usr/local/bin:/usr/local/sbin"     # Main brew location
local MAC_XORG="usr/X11/bin/"                       # Xquartz & brew Xorg apps
local MAC_PKGSRC="/Users/$USER/pkg/bin:/Users/$USER/pkg/sbin"

# PATH export ##################### {{{2
if [[ $CURRENT_OS == 'MACOSX' ]]; then
  export PATH="$MAC_RUBIES:$MAC_BREW:$MAC_PKGSRC:$MAC_LATEX:$MAC_BASIC:$MAC_XORG:$MAC_HOMESCRIPTS:$PATH"
fi

# Set Package Repo for OpenBSD #### {{{1
if [[ $CURRENT_OS == 'OpenBSD' ]]; then
  export PKG_PATH=http://ftp.fr.openbsd.org/pub/OpenBSD/`uname -r`/packages/`arch -s`/
fi

# App specific configs ############ {{{1
# GPodder folders ################# {{{2
if [[ $CURRENT_OS == 'MACOSX' ]]; then
  launchctl setenv GPODDER_HOME /Users/xavier/.gpodder
  launchctl setenv GPODDER_DOWNLOAD_DIR /Users/xavier/gpodder
else
  export GPODDER_HOME='$HOME/.gpodder'
  export GPODDER_DOWNLOAD_DIR='$HOME/gpodder'
fi

# HomeBrew Configurations ######### {{{2
# Sets correct path for brew-cask symlinks
if [[ $CURRENT_OS == 'MACOSX' ]]; then
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi
