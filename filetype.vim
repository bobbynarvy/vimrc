" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.zig		setfiletype zig
  autocmd FileType zig setlocal commentstring=//\ %s
augroup END
