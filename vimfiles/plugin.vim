"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent off

if has("win32") || has('win64')
  set rtp+=$VIM/vimfiles/bundle/neobundle.vim/
  call neobundle#begin('$VIM/vimfiles/bundle')
elseif has("unix")
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
  call neobundle#begin('$HOME/.vim/bundle')
endif

"Enhanced
NeoBundle 'dimasg/vim-mark', {'on_map': ['<Leader>m', '<Leader>n'], 'on_cmd': ['Mark', 'MarkClear']}
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'kkoenig/wimproved.vim', {'disabled': !(has('win32') || has('win64'))}
NeoBundle 'matchit.zip'
NeoBundle 'mbbill/fencview', {'disabled': !has('iconv')}
NeoBundle 'mbbill/undotree', {'on_cmd': 'UndotreeToggle'}
NeoBundle 'miyakogi/conoline.vim'
NeoBundle 'osyo-manga/vim-over', {'on_cmd': 'OverCommandLine', 'disabled': !(has('python') || has('python3'))}
NeoBundle 'raimondi/delimitmate'
NeoBundle 'shougo/vimproc.vim', {'build': {'unix': 'make'}}
NeoBundle 'shougo/vimshell.vim', {'on_cmd': [{'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'}, 'VimShellExecute', 'VimShellInteractive', 'VimShellTerminal', 'VimShellPop'], 'on_map': '<Plug>'}
NeoBundle 'tpope/vim-speeddating', {'on_map': ['<C-a>', '<C-x>']}
NeoBundle 'vim-airline/vim-airline'

"Search, Explore
NeoBundle 'ctrlpvim/ctrlp.vim', {'on_map': '<C-p>', 'on_cmd': 'CtrlP'}
NeoBundle 'dkprice/vim-easygrep', {'on_map': ['<Leader>vv', '<Leader>vr', '<Leader>vR'], 'on_cmd': 'Grep'}

"C Family
NeoBundle 'a.vim', {'on_ft': ['c', 'cpp']}
NeoBundle 'justmao945/vim-clang', {'on_ft': ['c', 'cpp'], 'disabled': !executable('clang')}
NeoBundle 'lendyzhang/vim-emax', {'on_ft': ['c', 'cpp']}

"Python
NeoBundle 'davidhalter/jedi-vim', {'on_ft': 'python', 'disabled': !(has('python') || has('python3'))}

"Go
NeoBundle 'fatih/vim-go', {'on_ft': 'go', 'on_cmd': ['GoInstallBinaries', 'GoUpdateBinaries', 'GoPath'], 'disabled': !executable('go')}

"Web development
NeoBundle 'chrisbra/colorizer', {'on_ft': ['css', 'html', 'javascript']}
NeoBundle 'ternjs/tern_for_vim', {'on_ft': 'javascript', 'disabled': !(has('python') || has('python3')) || !executable('npm'), 'build': 'npm update'}

"Git related
NeoBundle 'airblade/vim-gitgutter', {'disabled': !executable('git')}
NeoBundle 'tpope/vim-fugitive', {'disabled': !executable('git')}
NeoBundle 'gregsexton/gitv', {'on_cmd': 'Gitv', 'disabled': !neobundle#is_installed('vim-fugitive')}

"Coding
NeoBundle 'jsfaint/gen_tags.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter', {'on_map': ['<Leader>cc', '<Leader>cu', '<Leader>cb', '<Leader>cs']}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shougo/context_filetype.vim', {'on_i': 1}
NeoBundle 'shougo/echodoc.vim', {'on_source': 'context_filetype.vim'}
NeoBundle 'shougo/vinarise.vim', {'on_cmd': ['Vinarise', 'VinariseDump'], 'disabled': !(has('python') || has('python3'))}
NeoBundle 'thirtythreeforty/lessspace.vim', {'on_i': 1}
NeoBundle 'yggdroot/indentline'
NeoBundle 'honza/vim-snippets', {'on_source': 'neosnippet.vim'}
NeoBundle 'shougo/neosnippet-snippets', {'on_source': 'neosnippet.vim'}
NeoBundle 'shougo/neosnippet.vim', {'on_i': 1}
NeoBundle 'shougo/neocomplete.vim', {'disabled': !has('lua')}
NeoBundle 'shougo/neco-syntax', {'on_source': 'neocomplete.vim', 'disabled': !neobundle#is_installed('neocomplete.vim')}
NeoBundle 'shougo/neco-vim', {'on_ft': 'vim', 'on_source': 'neocomplete.vim', 'disabled': !neobundle#is_installed('neocomplete.vim')}
NeoBundle 'shougo/neoinclude.vim', {'on_source': 'neocomplete.vim', 'disabled': !neobundle#is_installed('neocomplete.vim')}

call neobundle#end()

NeoBundleCheck

filetype plugin indent on

"A
if neobundle#is_installed('a.vim')
  let g:alternateNoDefaultAlternate = 1
endif

"Tagbar
if neobundle#is_installed('tagbar')
  map <silent> <Leader>t <esc>:TagbarToggle<CR>
  let g:tagbar_sort = 0
  let g:tagbar_left = 1
  let g:tagbar_compact = 1
endif

"EasyGrep
if neobundle#is_installed('vim-easygrep')
  let EasyGrepMode = 0
  let EasyGrepRecursive = 1
  let EasyGrepIgnoreCase = 1
  let EasyGrepReplaceWindowMode = 2
  let EasyGrepJumpToMatch = 0
  let g:EasyGrepFilesToExclude = "GPATH,GRTAGS,GTAGS"
  let EasyGrepWindowPosition = "botright"

  if executable('pt')
    set grepprg=pt
    let EasyGrepCommand = 1
  elseif executable('grep')
    set grepprg=grep
    let EasyGrepCommand = 1
  else
    set grepprg=''
    let EasyGrepCommand = 0
  endif
endif

"neocomplete.vim
if neobundle#is_installed('neocomplete.vim')
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
    let g:neocomplete#sources#omni#input_patterns.c =
          \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp =
          \'[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  endif

  let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_at_startup = 1
endif

"neosnippet
if neobundle#is_installed('neosnippet.vim')
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  let g:neosnippet#enable_snipmate_compatibility = 1
endif

"vim-clang
if neobundle#is_installed('vim-clang')
  if neobundle#is_installed('neocomplete.vim')
    let g:clang_auto = 0
  endif

  let g:clang_verbose_pmenu = 1
  let g:clang_format_style = 'webkit'

  if has('patch-7.4.775')
    let g:clang_c_completeopt = 'menuone,noinsert'
    let g:clang_cpp_completeopt = 'menuone,noinsert,preview'
  endif
endif

"echodoc.vim
if neobundle#is_installed('echodoc.vim')
  let g:echodoc_enable_at_startup = 1
endif

"CtrlP
if neobundle#is_installed('ctrlp.vim')
  let g:ctrlp_mruf_relative = 1
  let g:ctrlp_max_files = 0

  if has('unix')
    let g:ctrlp_user_command = 'find %s -type f'
    let g:ctrlp_clear_cache_on_exit = 1
  elseif has('win32') || has('win64')
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
    let g:ctrlp_clear_cache_on_exit = 1
  endif
endif

"Mark
if neobundle#is_installed('vim-mark')
  let g:mwDefaultHighlightingPalette = 'maximum'
  let g:mwAutoLoadMarks = 1
  let g:mwAutoSaveMarks = 1
  set viminfo+=! "Save and restore global variables
endif

"airline
if neobundle#is_installed('vim-airline')
  let g:airline_left_sep =''
  let g:airline_right_sep = ''
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  set noshowmode
endif

"syntastic
if neobundle#is_installed('syntastic')
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 2
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  if has('gui_running')
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_style_error_symbol = '✠'
    let g:syntastic_style_warning_symbol = '≈'
  endif
endif

"tern.js
if neobundle#is_installed('tern_for_vim')
  autocmd FileType javascript nnoremap <buffer> <silent> <C-]> :TernDef<CR>
  autocmd FileType javascript nnoremap <buffer> <silent> K :TernDoc<CR>
  let g:tern_show_signature_in_pum = 1
endif

"jedi-vim
if neobundle#is_installed('jedi-vim')
  autocmd FileType python nnoremap <buffer> <silent> <C-]> :call jedi#goto()<CR>
endif

"Wimproved
if neobundle#is_installed('wimproved.vim')
  autocmd GUIEnter * silent! WToggleClean
  map <F11> :WToggleFullscreen<CR>
endif

"incsearch.vim
if neobundle#is_installed('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

"undotree
if neobundle#is_installed('undotree')
  let g:undotree_WindowLayout = 2
endif
