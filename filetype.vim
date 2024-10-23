" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.zig		setfiletype zig
  au! BufRead,BufNewFile *.js	        setfiletype javascript
  autocmd FileType zig setlocal commentstring=//\ %s tabstop=4 shiftwidth=4 expandtab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
augroup END
