dotfiles
========

My dotfiles to be shared easily across computers

They have 2 dependencies: git and zsh.
  * zsh is necessary to run bootstrap script (could be replaced by sh script
    but I don't know borne shell)
  * git is necessary to pull submodules and to pull antigen submodules

This is the usual workflow after I format, change of OS or fully upgrade a
machine:
  * pull install script and dotfiles
  * run the corresponding install script for that machine (found in the
    [installs repo][installrepo])
  * bootstrap
  * Enjoy

All vim plugins (including [Pathogen][pathogen] itself) are contained in their
own git submodule!

The <code>bootstrap.zsh</code> script is a rewrite in zsh (instead of bash) of
[Mathias Bynens bootstrap.sh][mathias] with a few extra features!

I though of updating submodules (vim plugins) automatically after rsyncing
files to home directory but it is too dangerous for me.

Zsh plugins are now handled with [Antigen][antigen] but starting time isn't
great and pulling git submodules at start is weird. I'm considering replacing
[Pathogen][pathogen] with [Vundle][vundle].

Todo
----
  * check path setup isn't redundant

[installrepo]: https://github.com/disrupts/installs
[mathias]:     https://github.com/mathiasbynens/dotfiles
[pathogen]:    https://github.com/tpope/vim-pathogen
[vundle]:      https://github.com/gmarik/Vundle.vim
[antigen]:     https://github.com/zsh-users/antigen
