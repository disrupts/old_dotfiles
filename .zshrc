# zshrc at $HOME/.zshrc ###########
# vim: nowrap fdm=marker

# Oh-My-Zsh configs ############### {{{1

# Path to oh-my-zsh configuration {{{2
ZSH=$HOME/.oh-my-zsh

# OH-MY-ZSH Themes ################ {{{2
#default ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="gentoo"
#ZSH_THEME="candy"
ZSH_THEME="af-magic" # the one I like the most, broken on update
#ZSH_THEME="bira"
#ZSH_THEME="fino" # without rvm colours are off
#ZSH_THEME="gnzh"

# Oh-My-Zsh Commented Variables ### {{{2

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# OH-MY-ZSH Plugins ############### {{{2
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew brew-cask bundler cabal gem mercurial nyan pip python pyenv ruby zsh-syntax-highlighting lol) # colorize vi-mode)

# Loading Oh-My-Zsh ############### {{{2
source $ZSH/oh-my-zsh.sh

# Alias ########################### {{{1

# Basic ########################### {{{2
# vim with CTRL-S for zsh
#alias vim="stty stop '' -ixoff ; /Applications/MacVim.app/Contents/MacOS/Vim"
#alias vim="/usr/local/Cellar/macvim/7.4-72/MacVim.app/Contents/MacOS/Vim" # with brew macvim, could do it better, installing also vim?

# main general alias ############## {{{2
alias top='htop'

# Internet ######################## {{{2
alias ip="curl ip.appspot.com"
alias who="lsof -P -i -n"
alias ping='ping -c 5'
alias pingnodns='ping -c 5 8.8.8.8'
alias pinggoo='ping -c 5 www.google.com'

# Navigation ###################### {{{2
alias ..="cd .."
alias home="cd ~"

# Packet & Source Management ###### {{{2

# Mac OS X ######################## {{{3

# Install and update [MacPorts] ### {{{4
#alias update="sudo port -v selfupdate"
#alias upgrade="sudo port -v upgrade outdated"
#alias search="port -v search"
#alias pinfo="port -v info"
#alias get="sudo port -v install"
#alias forget="sudo port -v uninstall --follow-dependencies"
#alias plist="port -v installed"
#alias pclean="sudo port clean --all installed"
#alias prmold="sudo port -f uninstall inactive"

# Install and update [Homebrew] ### {{{4
alias update="brew update"
alias upgrade="brew upgrade"
alias search="brew search"
alias binfo="brew info"
alias get="brew install"
alias forget="brew remove"
alias blist="brew list"
alias bclean="brew cleanup"

# Multimedia ###################### {{{2
alias play_dvd="mplayer -vo xv dvdnav://"
alias play="mplayer"

# dvtm changing meta key ########## {{{2
alias dvtm="dvtm -m '^a'"

# python3 is too dificult to type # {{{2
alias python="python3"
alias pip="pip3"

# sudo configuration ############## {{{2
# (i'll end up using only su)
# When using sudo, use alias expansion (otherwise sudo ignores your aliases)
#alias sudo="sudo " #http://www.shellperson.net/using-sudo-with-an-alias/
#alias sudo="sudo "

# HomeBrew Configurations ######### {{{1
# Sets correct path for brew-cask symlinks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Setting PATH #################### {{{1

# Mac OS X PATH ################### {{{2
# instructions http://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/texbin:~/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin/:$PATH"
# ruby gems:   /usr/local/opt/ruby/bin
# LaTex stuff: /usr/texbin
# brew:        /usr/local/bin /usr/local/sbin
# X (Mac os x): /usr/X11/bin/

# Brew autocompletion & RVM ?? #### {{{1
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath


# Zsh VI config ### ############### {{{1

# mode, e for emacs, v for vi, #### {{{2
# set to emacs because vi breaks incremental search
#bindkey -v

# Opp addon ####################### {{{2
#source ~/.oh-my-zsh/custom/plugins/opp.zsh/opp.zsh
#source ~/.oh-my-zsh/custom/plugins/opp.zsh/opp/*.zsh

# Bindkeys & INSERT/NORMAL display  {{{2

#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward
#bindkey 'ñ'  vi-cmd-mode

#function zle-line-init zle-keymap-select {
	#VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	#RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
	#zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1
