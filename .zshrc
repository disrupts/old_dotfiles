# zshrc at $HOME/.zshrc ###########
# vim: nowrap fdm=marker

# Auto-detect OS ################## {{{1
UNAME = `uname`
#CURRENT_OS='OpenBSD'
if [[ $UNAME == 'Darwin' ]]; then
  CURRENT_OS='MACOSX'
fi
export CURRENT_OS

# Set variables, aliases & functs # {{{1
source ~/.zshenv      # needs CURRENT_OS
source ~/.zshalias    # needs CURRENT_OS
source ~/.zshfn       # needs CURRENT_OS

# Launch Antigen ################## {{{1
source ~/.antigen/antigen.zsh

# Load oh-my-zsh ################## {{{1
antigen bundle robbyrussell/oh-my-zsh lib/

# Themes ########################## {{{1
antigen theme af-magic
#antigen theme xiong-chiamiov-plus
#antigen theme gentoo
#antigen theme candy
#antigen theme bira
#antigen theme fino # colors off without rvm
#antigen theme gnzh
#antigen theme random

# Plugins ######################### {{{1
# Version Control Systems ######### {{{2
antigen bundle git
antigen bundle mercurial

# Python ########################## {{{2
antigen bundle python
antigen bundle pip
#antigen bundle pyenv
#antigen bundle virtualenv

# Haskell ######################### {{{2
antigen bundle cabal

# Ruby ############################ {{{2
antigen bundle ruby
antigen bundle gem
antigen bundle bundler

# Extras ########################## {{{2
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# Fun ############################# {{{2
antigen bundle lol
antigen bundle nyan

# OS Specific ##################### {{{2
if [[ $CURRENT_OS == 'MACOSX' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
fi

# Apply Antigen ################### {{{1
antigen apply

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
