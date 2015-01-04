dotfiles
========

My dotfiles to be shared easily across computers

They have 2 dependencies: git and zsh.
  * zsh is necessary to run bootstrap script (could be replaced by sh script but I don't know borne shell)
  * git is necessary to pull submodules and to pull antigen submodules

This is the usual workflow after I format, change of OS or fully upgrade a machine:
  * pull install script and dotfiles
  * run the corresponding install script for that machine (found in the [installs repo][installrepo])
  * bootstrap
  * Enjoy 

All vim plugins (including [Pathogen][pathogen] itself) is contained in its own git submodule!

The <code>bootstrap.sh</code> script comes from [Mathias Bynens dotfiles][mathias]

I though of updating submodules (vim plugins) automatically after rsyncing files to home directory but it is too dangerous for me.

Todo
----
  * add mapping to .vimrc to make it toggle the 81st column marker too, when toggling list! (viewing tabs and returns - <leader>l)
  * update PATH in .zshenv to be system specific
  * finish netinfo function in .zshfn

[installrepo]: https://github.com/disrupts/installs
[mathias]:     https://github.com/mathiasbynens/dotfiles
[pathogen]:    https://github.com/tpope/vim-pathogen
