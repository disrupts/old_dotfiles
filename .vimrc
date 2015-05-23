" vim: nowrap fdm=marker
set encoding=utf-8

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
let mapleader="-"           " changed from ',' and earlier 'ç'

" Preferences not set by sensible.vim            {{{2
set hidden                  " allow hidden buffers
set relativenumber          " set relative numbering
set number                  " set hybrid numbering
set history=5000
set showcmd
set nojoinspaces
set listchars=tab:▸\ ,eol:¬ " set new tab and return symbols
set foldlevelstart=9999     " folding max out by default
set noswapfile              " disables swap file - BAD
if has('mouse')             " Mouse disable in Insert mode
  set mouse=a "re-enable to test the setting
  "set mouse=nv
endif
set wrap                    " soft wraping
set linebreak               " remember to toggle nolist with <leader>-l
set incsearch               " lookahead search
set ignorecase              " ignore case
set smartcase               " smart case
set hlsearch                " highligh searches
set spelllang=en_gb         " set language to british english

" Omni-completion                                {{{2
set omnifunc=syntaxcomplete#Complete

" Mappings                                       {{{1
" disable arrow keys in insert mode              {{{2
inoremap <up>       <nop>
inoremap <down>     <nop>
inoremap <left>     <nop>
inoremap <right>    <nop>

" disable arrow keys in normal mode              {{{2
nnoremap <up>       <nop>
nnoremap <down>     <nop>
nnoremap <left>     <nop>
nnoremap <right>    <nop>

" disable arrow keys in visual mode              {{{2
vnoremap <up>       <nop>
vnoremap <down>     <nop>
vnoremap <left>     <nop>
vnoremap <right>    <nop>

" un-highlight with Delete key - already ctrl-l {{{2
nmap <silent> <BS> :nohlsearch<CR>
" BAD should I remove <silent>

" use spacebar to fold                           {{{2
nnoremap <Space> za

" Enter BLOCK-VISUAL by default                  {{{2
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Shortcut to rapidly toggle `set list`          {{{2
" nnoremap <leader>l :set list! list?<CR>
nnoremap <leader>l :call <SID>Better_list_with_marker_and_hardwrap()<CR>
function <SID>Better_list_with_marker_and_hardwrap()
  if (&list == 0)
    set list
    set textwidth=0
    set formatoptions-=ta
    echom "auto-hardwrapping deactivated; list & column marker enabled"
  else
    set nolist
    set textwidth=79
    set formatoptions+=ta
    echom "list & column marker disabled; auto-hardwrapping activated"
  endif
endfunction

" Spell Checking                                 {{{2
nnoremap <leader>s :set spell!<CR>
" BAD should I remove <silent>
"nmap <silent> <leader>s :set spell!<CR>

" Change Spell Chacking Language                 {{{2
nnoremap <leader>sgb :set spelllang=en_gb<CR>
nnoremap <leader>ses :set spelllang=es_es<CR>
nnoremap <leader>sfr :set spelllang=fr<CR>

" Movement & navigation mappings                 {{{2
" Simplify movement around windows               {{{3
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Simplify changing window arrangement           {{{3
" vim can't distinguish ctrl-letter from ctrl-shift-letter
"nnoremap <C-S-h> <C-w>H
"nnoremap <C-S-j> <C-w>J
"nnoremap <C-S-k> <C-w>K
"nnoremap <C-S-l> <C-w>L

" Simplify movement around soft-wrapped lines    {{{3
nnoremap ¶ gj
nnoremap § gk
nnoremap <M-h> h
nnoremap <A-l> l

" Simplify movement around tabs                  {{{3
nnoremap <leader>n :tabprevious<CR>
inoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m :tabnext<CR>
inoremap <leader>m <esc>:tabnext<CR>

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

" Gundo mappings                                 {{{2
nnoremap <leader>u :GundoToggle<CR>

" Indent Mode (Tab configuration)                {{{1
" Tab config for every file                      {{{2
"   * 2 chars softabs
"   * 4 chars hardtabs
set ts=4 sts=2 sw=2 noexpandtab
" This one will be used on C, C++ files!

" FileType detection                             {{{1
" Markdown                                       {{{2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" *.markdown is already detected

" C header files - instead of C++                {{{2
autocmd BufNewFile,BufReadPost *.h set filetype=c

" Assembly will be understood as MIPS            {{{2
autocmd BufNewFile,BufReadPost *.asm set filetype=MIPS

" Fountain film-script detection                 {{{2
autocmd BufNewFile,BufReadPost *.fountain set filetype=fountain

" Visuals                                        {{{1
" Colourscheme                                   {{{2
colorscheme molokai

" Mark 81st column visible                       {{{2
" Trying out SmartColumnColor plugin instead of the following
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

" Powerline symbols!                             {{{2
" I should add some if statement in case the plugin is not there
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'badwolf'
"let g:airline_theme           = 'powerlineish'
set noshowmode

" Executed when opening & closing a buffer       {{{1
" Go to last location when opening a file        {{{2
 autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\""
                   \|  endif

" Saves the state of foldings and reopens them   {{{2
" BROKEN
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

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
autocmd BufWritePre *.c,*.h,*.rb,*.py,*.js,*.hs :call <SID>StripTrailingWhitespaces()

" Notes                                          {{{1

"runtime! plugin/sensible.vim
" & somehow, the pluggin changes some colours! the magenta marker for char 80
" is grey... not visible with some colorschemes in grafical vim
