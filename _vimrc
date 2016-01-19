" vim:shiftwidth=2:tabstop=2:expandtab
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has("win32")
  set rtp+=$VIM/vimfiles/bundle/neobundle.vim/
  call neobundle#begin('$VIM/vimfiles/bundle')
elseif has("unix")
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
  call neobundle#begin('$HOME/.vim/bundle')
endif

"Enhanced
NeoBundle 'bling/vim-airline'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'kkoenig/wimproved.vim', {'disabled': !has('win32')}
NeoBundle 'mbbill/fencview', {'disabled': !has('iconv')}
NeoBundle 'mbbill/undotree'
NeoBundle 'osyo-manga/vim-over', {'disabled': !has('python')}
NeoBundle 'shougo/vimproc.vim', {'build': {'unix': 'make'}}
NeoBundle 'shougo/vimshell.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-speeddating'

"Search, Explore
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'dkprice/vim-easygrep'
NeoBundle 'scrooloose/nerdtree'

"C Family
NeoBundle 'a.vim'
NeoBundle 'lendyzhang/vim-emax'
NeoBundle 'osyo-manga/vim-marching', {'disabled': !executable('clang') || !has('python')}
NeoBundle 'osyo-manga/vim-reunions', {'disabled': !executable('clang')}

"Python
NeoBundle 'davidhalter/jedi-vim', {'disabled': !has('python')}

"Go
NeoBundle 'fatih/vim-go', {'disabled': !executable('go')}

"Web development
NeoBundle 'chrisbra/colorizer'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'ternjs/tern_for_vim', {'disabled': !has('python')}

"Git related
NeoBundle 'mhinz/vim-signify', {'disabled': !executable('git')}
NeoBundle 'tpope/vim-fugitive', {'disabled': !executable('git')}

"Coding
NeoBundle 'jsfaint/gen_tags.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'matchit.zip'
NeoBundle 'raimondi/delimitmate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shougo/vinarise.vim', {'vim_version': '7.3', 'disabled': !has('python')}
NeoBundle 'yggdroot/indentline'
if has('lua')
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'shougo/context_filetype.vim'
  NeoBundle 'shougo/echodoc.vim'
  NeoBundle 'shougo/neco-syntax'
  NeoBundle 'shougo/neco-vim'
  NeoBundle 'shougo/neocomplete.vim'
  NeoBundle 'shougo/neoinclude.vim'
  NeoBundle 'shougo/neosnippet-snippets'
  NeoBundle 'shougo/neosnippet.vim'
else
  NeoBundle 'ajh17/VimCompletesMe'
endif

if has('mac')
  NeoBundle 'rizzatti/dash.vim'
endif

call neobundle#end()

NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Get out of VI's compatible mode..
set nocompatible

"Enable filetype plugin
filetype plugin indent on

"Set to auto read when a file is changed from the outside
set autoread

"Enable use of the mouse
set mouse=a

" Hide the mouse when typing text
set mousehide

"Set mapleader
let g:mapleader = ","

"Fast saving
nmap \w :update<CR>

"Fast editing of vimrc
if has("win32")
  nmap <Leader>e :e! $VIM/_vimrc<CR>
elseif has("unix")
  nmap <Leader>e :e! $HOME/.vimrc<CR>
endif

"Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

let $LANG = 'en_US.UTF-8'
set langmenu=en_US
if has('win32')
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
endif

"Enable syntax highlight
syntax enable

"set GUI font
if has("win32")
  set guifont=Sauce\ Code\ Powerline:h10
elseif has("macunix")
  set guifont=Sauce\ Code\ Powerline:h12
elseif has("unix")
  set guifont=Sauce\ Code\ Powerline\ 11
endif

if has("gui_running")
  if has("win32")
    au GUIEnter * simalt ~x
  endif

  if neobundle#is_sourced('molokai')
    colorscheme molokai
  endif

  set guioptions-=b "Bottom scrollbar
  set guioptions-=r "Right-hand scrollbar
  set guioptions-=L "Left-hand scrollbar
  set guioptions-=T "Toolbar
  set guioptions-=m "Menu bar
  set guioptions+=c "console dialogs
else
  if neobundle#is_sourced('molokai')
    colorscheme molokai
    let g:rehash256 = 1
  endif
endif

autocmd BufEnter * :syntax sync fromstart

set nocursorline

"Set 7 lines to the cursor - when moving vertical..
set so=7

"Turn on wild menu
set wildmenu

"Ignore these patterns
set wildignore=*.bak,*.o,*.e,*~

"Number of screen lines to use for the command-line
set cmdheight=2

set showcmd

"Show line number
set number

"Change buffer - without saving
set hidden

"Set backspace
set backspace=eol,start,indent

"Set listchars
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<
set list

"Wrap lines
set wrap

"Backspace and cursor keys wrap to
set whichwrap+=<,>

"Cancel wrap when searching meet the start/end of the file.
set nowrapscan

"Ignore case when searching
set ignorecase
set incsearch

"Highlight search things
set hlsearch

"Visual Search
xnoremap * y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
xnoremap # y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set visualbell

set ffs=unix,dos

nmap <Leader>fd :se ff=dos<CR>
nmap <Leader>fu :se ff=unix<CR>

"Always show the statusline
set laststatus=2

"Switch to current directory
nmap <Leader>cd :cd %:p:h<CR>

set completeopt+=menuone

"Turn backup off
set nobackup
set nowritebackup
set noswapfile

"Jump to line when reopen a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set ambiwidth=double

"Auto indent
set autoindent

"Smart indent
set smartindent

"No Highlight
map <silent> <Leader><CR> :noh<CR>

"Remove the Windows ^M
noremap \m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

"Remove trailing
nmap <leader>l :%s/\s*$//g<CR>:noh<CR>

"persistent undo
function! Make_undodir()
  if version >= 703 && has('persistent_undo')
    let l:dir = expand("$HOME/.cache/undodir")
    set undofile
    exec 'set undodir=' . l:dir

    if !isdirectory(l:dir)
      call mkdir(l:dir, "p")
    endif
  endif
endfunction
call Make_undodir()

"Enable/Disable IME
if has('gui_running') && has("win32")
  autocmd! InsertLeave * set imdisable
  autocmd! InsertEnter * set noimdisable
  noremap / :set noimdisable<CR>/
endif

"Disable expandtab for makefile
autocmd FileType make setlocal noexpandtab

"Setting for VimL
autocmd FileType vim map <buffer> <Leader><space> :w!<CR>:source %<CR>
autocmd FileType vim setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vim nnoremap <buffer> <silent> K :execute("help " . expand("<cword>"))<CR>

autocmd FileType html,javascript setlocal expandtab shiftwidth=2 softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A
if neobundle#is_sourced('a.vim')
  let g:alternateNoDefaultAlternate = 1
endif

"Tagbar
if neobundle#is_sourced('tagbar')
  map <silent> <Leader>t <esc>:TagbarToggle<CR>
  let g:tagbar_sort = 0
  let g:tagbar_left = 1
  let g:tagbar_compact = 1
endif

"EasyGrep
if neobundle#is_sourced('vim-easygrep')
  let EasyGrepMode = 0
  let EasyGrepRecursive = 1
  let EasyGrepIgnoreCase = 1
  let EasyGrepReplaceWindowMode = 2
  let EasyGrepJumpToMatch = 0
  let g:EasyGrepFilesToExclude = "GPATH,GRTAGS,GTAGS"

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

"vim-marching
if neobundle#is_sourced('vim-marching')
  if neobundle#is_sourced('neocomplete.vim')
    let g:marching_enable_neocomplete = 1
  endif
  let g:marching_enable_auto_select = 1
endif

"neocomplete.vim
if neobundle#is_sourced('neocomplete.vim')
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

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

  "neosnippet
  if neobundle#is_sourced('neosnippet.vim')
    let g:neosnippet#enable_snipmate_compatibility = 1
  endif

  "echodoc.vim
  if neobundle#is_sourced('echodoc.vim')
    let g:echodoc_enable_at_startup = 1
  endif
endif

"CtrlP
if neobundle#is_sourced('ctrlp.vim')
  let g:ctrlp_mruf_relative = 1
  let g:ctrlp_regexp = 1
  let g:ctrlp_max_files = 0

  if executable('pt')
    let g:ctrlp_user_command = 'pt -g . %s'
    let g:ctrlp_clear_cache_on_exit = 1
  else
    if has('unix')
      let g:ctrlp_user_command = 'find %s -type f'
      let g:ctrlp_clear_cache_on_exit = 1
    elseif has('win32')
      let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
      let g:ctrlp_clear_cache_on_exit = 1
    else
      let g:ctrlp_user_command = ''
      let g:ctrlp_clear_cache_on_exit = 0
    endif
  endif
endif

"Mark
if neobundle#is_sourced('vim-mark')
  let g:mwDefaultHighlightingPalette = 'maximum'
  let g:mwAutoLoadMarks = 1
  let g:mwAutoSaveMarks = 1
  set viminfo+=! "Save and restore global variables
endif

"airline
if neobundle#is_sourced('vim-airline')
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  set noshowmode
else
  set statusline=%m\%F%r\ %w%=%y\ L:%l/%L\ C:%c\ (%p%%)
  set showmode
endif

"undotree
if neobundle#is_sourced('undotree')
  nmap <leader>u :UndotreeToggle<CR>
  let g:undotree_WindowLayout = 2
endif

"Nerdtree
if neobundle#is_sourced('nerdtree')
  nmap <leader>nt :NERDTreeToggle<CR>
endif

"syntastic
if neobundle#is_sourced('syntastic')
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
if neobundle#is_sourced('tern_for_vim')
  autocmd FileType javascript nnoremap <buffer> <silent> <C-]> :TernDef<CR>
  autocmd FileType javascript nnoremap <buffer> <silent> K :TernDoc<CR>
  let g:tern_show_argument_hints = 'on_move'
  let g:tern_show_signature_in_pum = 1
endif

"jedi-vim
if neobundle#is_sourced('jedi-vim')
  autocmd FileType python nnoremap <buffer> <silent> <C-]> :call jedi#goto()<CR>
endif

"Wimproved
if neobundle#is_sourced('wimproved.vim')
  autocmd GUIEnter * silent! WToggleClean
  map <F11> :WToggleFullscreen<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extra Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NOTE: extra.vim is for some special setting
"  which is volatile, platform related, but non-standard setting
function! Load_extra()
  "Extra setting out of vimrc
  if has("win32")
    let l:extra_conf = expand("$VIM/extra.vim")
  elseif has("unix")
    let l:extra_conf = expand("$HOME/.vim/extra.vim")
  endif

  if filereadable(l:extra_conf)
    execute 'source ' . fnameescape(l:extra_conf)
  endif
endfunction
call Load_extra()
