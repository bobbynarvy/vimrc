" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.zig		setfiletype zig
  autocmd FileType zig setlocal commentstring=//\ %s tabstop=4 shiftwidth=4 expandtab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4
augroup END
