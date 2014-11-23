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


# Set variables, aliases & functs # {{{1
source ~/.zshenv	  # sets CURRENT_OS
source ~/.zshalias	  # needs CURRENT_OS
source ~/.zshfn		  # needs CURRENT_OS

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
