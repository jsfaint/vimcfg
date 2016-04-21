" vim:shiftwidth=2:tabstop=2:expandtab
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

function! Load_conf()
  let list = ['config.vim', 'plugin.vim', 'extra.vim']

  if has("win32")
    let l:conf = expand("$VIM/vimfiles/")
  elseif has("unix")
    let l:conf = expand("$HOME/.vim/")
  endif

  for l:file in list
    if filereadable(expand(l:conf . l:file))
      execute 'source ' . fnameescape(expand(l:conf . l:file))
    endif
  endfor
endfunction
call Load_conf()
