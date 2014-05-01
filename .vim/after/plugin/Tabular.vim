" Mappings for Tabular function :Tabularize
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>a<bar> :Tabularize /\|<CR>
  vmap <leader>a<bar> :Tabularize /\|<CR>
endif
