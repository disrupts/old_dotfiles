# zshenv at $HOME/.zshenv #########
# vim: nowrap fdm=marker

export CURRENT_OS='MACOSX'

# Locale is not set in Mac OS X ### {{{1
export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Setting default apps ############ {{{1
export EDITOR="vim"
export BROWSER="firefox"

# Setting PATH #################### {{{1

if [[ $CURRENT_OS == 'MACOSX' ]]; then
  export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/Users/xavier/pkg/bin:/Users/xavier/pkg/sbin:/usr/texbin:~/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:$PATH"
fi

# PATH Elements
# =============
#
# ruby gems
# ---------
# Mac os x brew ruby:   /usr/local/opt/ruby/bin
# OpenBSD ruby gems:
#
# LaTex stuff
# -----------
# Mac os x:             /usr/texbin
# OpenBSD:
#
# Mac Specific
# ------------
# brew:        /usr/local/bin /usr/local/sbin
# X (Mac os x): /usr/X11/bin/
#
# Not currently included
# ----------------------
# pkgsrc:               ~/pkg/bin
#                       ~/pkg/sbin


# App specific configs ############ {{{1
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
