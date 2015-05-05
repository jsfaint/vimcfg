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

NeoBundleFetch 'shougo/neobundle.vim'

NeoBundle 'a.vim'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'dkprice/vim-easygrep'
NeoBundle 'jsfaint/gen_tags.vim'
NeoBundle 'lendyzhang/vim-emax'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'matchit.zip'
NeoBundle 'mbbill/undotree'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'raimondi/delimitMate'
NeoBundle 's3rvac/autofenc'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'shougo/vimproc.vim', {'build': 'make'}
NeoBundle 'shougo/vinarise.vim', {'vim_version': '7.3'}
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'yggdroot/indentLine'

if has('win32')
  NeoBundle 'shougo/neocomplete', {'disabled': !has('lua')}
  NeoBundle 'shougo/neosnippet', {'depends': 'shougo/neosnippet-snippets', 'disabled': !has('lua')}
endif

if has('unix')
  NeoBundle 'bling/vim-airline'
  NeoBundle 'mhinz/vim-signify'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'sirver/ultisnips', {'depends': 'honza/vim-snippets', 'vim_version': '7.3.584'}
  NeoBundle 'tdcdev/ycm_simple_conf', {'depends': 'valloric/youcompleteme', 'vim_version': '7.3.584'}
  NeoBundle 'valloric/youcompleteme', {'vim_version': '7.3.584'}
endif

if has('mac')
  NeoBundle 'rizzatti/dash.vim'
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

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

"Format the status line
set statusline=%m\%F%r\ %w%=%y\ L:%l/%L\ C:%c\ (%p%%)

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
set tabstop=8

au FileType html,vim,javascript setl shiftwidth=2 tabstop=2 expandtab
au FileType make setl noexpandtab

set ambiwidth=double

"Auto indent
set autoindent

"Smart indent
set smartindent

"Quick source for VimL
autocmd FileType vim map <buffer> <Leader><space> :w!<CR>:source %<CR>

"No Highlight
map <silent> <Leader><CR> :noh<CR>

"Remove the Windows ^M
noremap \m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

"Remove indenting on empty lines
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
if has("win32")
  autocmd! InsertLeave * set imdisable
  autocmd! InsertEnter * set noimdisable
  noremap / :set noimdisable<CR>/
endif

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A
let g:alternateNoDefaultAlternate = 1
nmap <leader>a :A<cr>

"tagbar
map <silent> <Leader>t <esc>:TagbarToggle<CR>
let g:tagbar_sort=0
let g:tagbar_left=1
let g:tagbar_compact=1

"EasyGrep
let EasyGrepMode=0
let EasyGrepRecursive=1
let EasyGrepIgnoreCase=1
let EasyGrepReplaceWindowMode=2
let g:EasyGrepFilesToExclude="GPATH,GRTAGS,GTAGS"

if executable('ag')
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

"neocomplete
if has('lua') && has('win32')
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#enable_smart_case=1
  let g:neocomplete#enable_auto_select=1

  "Plugin key-mappings.
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
endif

"CtrlP
let g:ctrlp_mruf_relative = 1
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0

"YouCompleteMe
if has('unix') && (v:version > 703 || (v:version == 703 && has('patch584')))
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:ycm_collect_identifiers_from_tags_files = 1
  nnoremap <leader>jd :YcmCompleter GoTo<CR>
endif

"Mark
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 1
set viminfo+=! "Save and restore global vriables

"airline
if !has('win32')
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
endif

"undotree
nmap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
