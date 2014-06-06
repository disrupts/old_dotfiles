" Mappings for Tabular function :Tabularize
if exists(":Tabularize")
  nnoremap <leader>a= :Tabularize /=<CR>
  vnoremap <leader>a= :Tabularize /=<CR>
  nnoremap <leader>a: :Tabularize /:\zs<CR>
  vnoremap <leader>a: :Tabularize /:\zs<CR>
  nnoremap <leader>a<bar> :Tabularize /\|<CR>
  vnoremap <leader>a<bar> :Tabularize /\|<CR>
endif
