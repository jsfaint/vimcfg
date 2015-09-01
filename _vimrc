" vim:shiftwidth=2:tabstop=2:expandtab
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

"neobundle, it should be in the front of vimrc to avoid some weird errors.
filetype off

if has("win32")
  set rtp+=$VIM/vimfiles/bundle/neobundle.vim/
  call neobundle#begin('$VIM/vimfiles/bundle')
elseif has("unix")
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
  call neobundle#begin('$HOME/.vim/bundle')
endif

NeoBundle 'a.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/colorizer'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'dkprice/vim-easygrep'
NeoBundle 'fatih/vim-go'
NeoBundle 'gregsexton/gitv', {'depends': 'tpope/vim-fugitive'}
NeoBundle 'honza/vim-snippets', {'depends': 'shougo/neosnippet.vim'}
NeoBundle 'jsfaint/gen_tags.vim'
NeoBundle 'lendyzhang/vim-emax'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mbbill/fencview'
NeoBundle 'mbbill/undotree'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'osyo-manga/vim-marching', {'depends': ['shougo/vimproc.vim', 'osyo-manga/vim-reunions'], 'disabled': !executable('clang')}
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'raimondi/delimitmate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shougo/context_filetype.vim', {'depends': 'shougo/neocomplete.vim'}
NeoBundle 'shougo/neco-syntax', {'depends': ['shougo/neco-vim'. 'shougo/neocomplete.vim']}
NeoBundle 'shougo/neco-vim', {'depends': 'shougo/neocomplete.vim'}
NeoBundle 'shougo/neocomplete.vim', {'disabled': !has('lua')}
NeoBundle 'shougo/neoinclude.vim', {'depends': 'shougo/neocomplete.vim'}
NeoBundle 'shougo/neosnippet-snippets', {'depends': 'shougo/neosnippet.vim'}
NeoBundle 'shougo/vimproc.vim', {'build': {'unix': 'make -f make_unix.mak', 'mac': 'make -f make_mac.mak'}}
NeoBundle 'shougo/vinarise.vim', {'vim_version': '7.3'}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'vimtaku/hl_matchit.vim', {'depends': 'matchit.zip'}
NeoBundle 'yggdroot/indentline'

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

"Sets how many lines of history VIM have to remember
set history=50

"Enable filetype plugin
filetype plugin indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

" Hide the mouse when typing text
set mousehide

"Set mapleader
let g:mapleader=","

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

let $LANG='en_US.UTF-8'
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

  colorscheme desert

  set guioptions-=b "Bottom scrollbar
  set guioptions-=r "Right-hand scrollbar
  set guioptions-=L "Left-hand scrollbar
  set guioptions-=T "Toolbar
  set guioptions-=m "Menu bar
  set guioptions+=c "console dialogs
else
  colorscheme desert
endif

autocmd BufEnter * :syntax sync fromstart

set nocursorline

"Set numbers of terminal colors
set t_Co=256

"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu
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

"show matching brackets
set showmatch
"Tenths of a second to show the matching pattern.
set matchtime=10

"Show mode, insert/replaced/visual/etc
set showmode

"Filetypes
set ffs=unix,dos

nmap <Leader>fd :se ff=dos<CR>
nmap <Leader>fu :se ff=unix<CR>

"Always show the statusline
set laststatus=2

"Switch to current dir
nmap <Leader>cd :cd %:p:h<CR>

set completeopt=longest,menuone

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
autocmd FileType make setlocal noexpandtab

set ambiwidth=double

"Auto indent
set autoindent

"Smart indent
set smartindent

"Quick source for VimL
autocmd FileType vim map <buffer> <Leader><space> :w!<CR>:source %<CR>
autocmd FileType vim setlocal expandtab shiftwidth=2 softtabstop=2

"No Highlight
map <silent> <Leader><CR> :noh<CR>

"Remove the Windows ^M
noremap \m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

"Remove trailing
nmap <leader>l :%s/\s*$//g<CR>:noh<CR>

"persistent undo
function! Make_undodir()
  if version >= 703 && has('persistent_undo')
    let l:dir=expand("$HOME/.cache/undodir")
    set undofile
    exec 'set undodir=' . l:dir

    if !isdirectory(l:dir)
      call mkdir(l:dir, "p")
    endif
  endif
endfunction
call Make_undodir()

"Enable/Disable IME
if has('gui_running') && (has("win32"))
  autocmd! InsertLeave * set imdisable
  autocmd! InsertEnter * set noimdisable
  noremap / :set noimdisable<CR>/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A
if neobundle#is_sourced('a.vim')
  let g:alternateNoDefaultAlternate = 1
endif

"tagbar
if neobundle#is_sourced('tagbar')
  map <silent> <Leader>t <esc>:TagbarToggle<CR>
  let g:tagbar_sort=0
  let g:tagbar_left=1
  let g:tagbar_compact=1
endif

"EasyGrep
let EasyGrepMode=0
let EasyGrepRecursive=1
let EasyGrepIgnoreCase=1
let EasyGrepReplaceWindowMode=2
let EasyGrepJumpToMatch=0
let g:EasyGrepFilesToExclude="GPATH,GRTAGS,GTAGS"

if executable('pt')
  set grepprg=pt
  let EasyGrepCommand = 1
elseif executable('ag')
  set grepprg=ag
  let EasyGrepCommand = 1
elseif executable('ack')
  set grepprg=ack
  let EasyGrepCommand = 1
elseif executable('grep')
  set grepprg=grep
  let EasyGrepCommand = 1
else
  set grepprg=''
  let EasyGrepCommand = 0
endif

"neocomplete.vim
if neobundle#is_sourced('neocomplete.vim')
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#enable_smart_case=1
  let g:neocomplete#enable_auto_select=1
  let g:neocomplete#enable_insert_char_pre = 1
  let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

  "Plugin key-mappings.
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y> neocomplete#close_popup()
  inoremap <expr><C-e> neocomplete#cancel_popup()

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.objc =
        \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
  let g:neocomplete#force_omni_input_patterns.objcpp =
        \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'

  if neobundle#is_sourced('vim-go')
    let g:neocomplete#force_omni_input_patterns.go =
          \ '[^.[:digit:] *\t]\.\w*'
  endif
endif

"vim-marching
if neobundle#is_sourced('vim-marching')
  let g:marching_enable_neocomplete = 1
  let g:marching_enable_auto_select = 1
  if has('win32')
    let g:marching_include_paths = [
          \ "C:/Program Files (x86)/LLVM/include"
          \]
  elseif has('mac')
    let g:marching_include_paths = [
          \ "/usr/include",
          \ "/usr/local/include",
          \ "/Library/Developer/CommandLineTools/usr/include"
          \]
  elseif has('unix')
    let g:marching_include_paths = [
          \ "/usr/include",
          \ "/usr/local/include"
          \]
  endif
endif

"neosnippet
if neobundle#is_sourced('neosnippet.vim')
  let g:neosnippet#enable_snipmate_compatibility = 1
endif

"CtrlP
if neobundle#is_sourced('ctrlp.vim')
  let g:ctrlp_mruf_relative = 1
  let g:ctrlp_regexp = 1
  let g:ctrlp_max_files = 0
  if has('unix')
    let g:ctrlp_user_command = {
          \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
          \ },
          \ 'fallback': 'find %s -type f'
          \ }
  else
    let g:ctrlp_user_command = {
          \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
          \ },
          \ 'fallback': 'dir %s /-n /b /s /a-d'
          \ }
  endif
endif

"Mark
if neobundle#is_sourced('vim-mark')
  let g:mwDefaultHighlightingPalette = 'maximum'
  let g:mwAutoLoadMarks = 1
  let g:mwAutoSaveMarks = 1
  set viminfo+=! "Save and restore global vriables
endif

"airline
if neobundle#is_sourced('vim-airline')
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
else
  set statusline=%m\%F%r\ %w%=%y\ L:%l/%L\ C:%c\ (%p%%)
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
endif

"hl_matchit
if neobundle#is_sourced('hl_matchit.vim')
  let g:hl_matchit_enable_on_vim_startup = 1
endif
