"neobundle, it should be in the front of vimrc to avoid some weird errors.
filetype off

if has("win32")
  set rtp+=$VIM/vimfiles/bundle/neobundle.vim/
  call neobundle#rc('$VIM/vimfiles/bundle')
elseif has("unix")
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
  call neobundle#rc('$HOME/.vim/bundle/')
endif

NeoBundleFetch 'Shougo/neobundle.vim', 'master'

NeoBundle 'EasyGrep'
NeoBundle 'Mark--Karkat'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'a.vim'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'jsfaint/gen_tags.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'matchit.zip'
NeoBundle 'mbbill/fencview'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'hewes/unite-gtags'

if has('lua')
  NeoBundle 'shougo/neocomplete'
  NeoBundle 'shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
else
  NeoBundle 'AutoComplPop'
  NeoBundle 'msanders/snipmate.vim'
endif

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
let g:mapleader = ","

"Fast saving
nmap \w :update<CR>

if has("win32")
  "Fast editing of _vimrc
  nmap <Leader>e :e! $VIM/_vimrc<CR>

  "When .vimrc is edited, reload it
  autocmd bufwritepost vimrc source /$VIM/_vimrc
elseif has("unix")
  "Fast editing of .vimrc
  nmap <Leader>e :e! $HOME/.vimrc<CR>

  "When .vimrc is edited, reload it
  autocmd bufwritepost vimrc source $HOME/.vimrc
endif

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

let $LANG='en_US.UTF-8'
set langmenu=en_US
source $VIMRUNTIME/delmenu.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable

"set font
if has("win32")
  set guifont=consolas:h11
elseif has("unix")
  set guifont=inconsolata\ 11
endif

if has("gui_running")
  if has("win32")
    "Auto Maximize when gvim startup in Windows system.
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
vnoremap * y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap # y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes, all set as unix file type.
set ffs=unix,dos,mac

nmap <Leader>fd :se ff=dos<CR>
nmap <Leader>fu :se ff=unix<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
"Always show the statusline
set laststatus=2

"Switch to current dir
nmap <Leader>cd :cd %:p:h<CR>

"Move a line of text using control
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

set completeopt=longest,menuone

"Format the status line
set statusline=%m\%F%r\ %w%=%y\ L:%l/%L\ C:%c\ (%p%%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowritebackup
set noswapfile

"Jump to line when reopen a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

au FileType html,vim,javascript setl shiftwidth=2 tabstop=2 expandtab
au FileType make setl noexpandtab

set ambiwidth=double

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set autoindent

"Smart indent
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VIM
autocmd FileType vim map <buffer> <Leader><space> :w!<CR>:source %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"No Highlight
map <silent> <Leader><CR> :noh<CR>

"Remove the Windows ^M
noremap \m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

"Remove indenting on empty lines
nmap <F2> :%s/\s*$//g<CR>:noh<CR>

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
autocmd! InsertLeave * set imdisable
autocmd! InsertEnter * set noimdisable
noremap / :set noimdisable<CR>/

"Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A
let alternateNoDefaultAlternate=1

"tagbar
map <silent> <Leader>t <esc>:TagbarToggle<CR>
let g:tagbar_sort=0

"EasyGrep
let EasyGrepMode=0
let EasyGrepRecursive=1

"Gundo
map <silent> <Leader>gu <esc>:GundoToggle<CR>

"neocomplete
if has('lua')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_camel_case = 1

  "Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

endif

"vinarise
let g:vinarise_enable_auto_detect = 1

"unite.vim
call unite#custom#source('file,file/new,buffer,file_rec', 'matchers', 'matcher_fuzzy')

nmap <Leader>u :Unite
nmap <Leader>ub :Unite buffer<CR>
nmap <leader>uf :Unite file -start-insert<CR>
if has('win32')
  nmap <Leader>ufr :Unite file_rec -start-insert<CR>
elseif has('unix')
  nmap <Leader>ufr :Unite file_rec/aysnc -start-insert<CR>
endif
