" vim: nowrap fdm=marker

" Pathogen Stuff                                 {{{1
call pathogen#infect()
filetype plugin indent on

" Included by sensible.vim                       {{{1
" set nocompatible
" set backspace+=indent,eol,start
" set backspace=indent,eol,start
" set ruler
" set hlsearch            " highlight search
" if !exists("syntax_on") " syntax highlighting
"   syntax on  		  
" endif


" Preferences                                    {{{1
" Esc key and Leader                             {{{2
map! ñ <Esc>
let mapleader=","           " changed from 'ç'

" Preferences not set by sensible.vim            {{{2
set hidden                  " allow hidden buffers
set relativenumber          " set relative numbering
set number                  " set hybrid numbering
set history=5000
set showcmd
set nojoinspaces
set listchars=tab:▸\ ,eol:¬ " set new tab and return symbols
set foldlevelstart=0        " folding max out by default
set noswapfile              " disables swap file - BAD
if has('mouse')             " Mouse disable in Insert mode
  set mouse=nv  
endif
set wrap                    " soft wraping
set linebreak               " remember to toggle nolist with <leader>-l
set incsearch               " lookahead search
set ignorecase              " ignore case
set smartcase               " smart case
set hlsearch                " highligh searches
set spelllang=en_gb         " set language to british english

" Mappings                                       {{{1
" disable arrow keys in insert mode              {{{2
inoremap <up> 		<nop>
inoremap <down>		<nop>
inoremap <left>		<nop>
inoremap <right>	<nop>

" un-highlight with Delete key - already ctrl-l {{{2
nmap <silent> <BS> :nohlsearch<CR>
" BAD should I remove <silent>

" use spacebar to fold                           {{{2
nnoremap <Space> za

" Mark 81st column visible                       {{{2
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Enter BLOCK-VISUAL by default                  {{{2
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Go to last location when opening a file        {{{2
 autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\""
                   \|  endif

" Shortcut to rapidly toggle `set list`          {{{2
nmap <leader>l :set list!<CR>

" Tab config for every file                      {{{2
"   * 2 chars softabs
"   * 4 chars hardtabs
set ts=4 sts=2 sw=2 noexpandtab

" Spell Checking                                 {{{2
nmap <silent> <leader>s :set spell!<CR>
" BAD should I remove <silent>

" Simplify movement around windows               {{{2
map <C-h> <C-w>H
map <C-j> <C-w>J
map <C-k> <C-w>K
map <C-l> <C-w>L

" Simplify movement around soft-wrapped lines    {{{2
map <C-j> gj
map <C-k> gk

" Opening files in the same path as current file {{{2
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Saving with ctrl-s - UNFINISHED                {{{2
"noremap <C-S> :update<CR>
"vnoremap <C-S> <C-C>:update<CR>
"inoremap <C-S> <C-O>:update<CR>

" Tabular mappings                               {{{2
" press '<leader> a' and the symbol to map
" added the following to /after/plugin/Tabular.vim

"if exists(":Tabularize")
  "nmap <leader>a= :Tabularize /=<CR>
  "vmap <leader>a= :Tabularize /=<CR>
  "nmap <leader>a: :Tabularize /:\zs<CR>
  "vmap <leader>a: :Tabularize /:\zs<CR>
  "nmap <leader>a<bar> :Tabularize /\|<CR>
  "vmap <leader>a<bar> :Tabularize /\|<CR>
"endif

" Colouscheme                                    {{{1
colorscheme molokai

" Executed when closing the buffer               {{{1
" Strip trailing whitespace                      {{{2
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.c,*.h,*.rb,*.py,*.js :call <SID>StripTrailingWhitespaces()
