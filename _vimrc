"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nmap \w :update<cr>

if has("win32")
  "Fast editing of _vimrc
  nmap <leader>e :e! $VIM/_vimrc<cr>

  "When .vimrc is edited, reload it
  autocmd bufwritepost vimrc source /$VIM/_vimrc
elseif has("unix")
  "Fast editing of .vimrc
  nmap <leader>e :e! $HOME/.vimrc<cr>

  "When .vimrc is edited, reload it
  autocmd bufwritepost vimrc source $HOME/.vimrc
endif

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

let $LANG = 'en_US.UTF-8'
set langmenu=en_US
source $VIMRUNTIME/delmenu.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlight
syntax enable

"set font
if has("win32")
  set guifont=consolas:h10
elseif has("unix")
  set guifont=inconsolata\ 10
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
  set guioptions-=e "tab style
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

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
"Always show the statusline
set laststatus=2

set switchbuf=usetab

"Switch to current dir
nmap <leader>cd :cd %:p:h<cr>

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

set completeopt=longest,menuone

"Format the status line
set statusline=%F\ %m%r%w%y\ Line:%l/%L\ Col:%c\ (%p%%)

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
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set foldmethod=syntax
set nofoldenable

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
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"No Highlight
map <silent> <leader><cr> :noh<cr>

"Remove the Windows ^M
noremap \m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Remove indenting on empty lines
nmap <F2> :%s/\s*$//g<cr>:noh<cr>

"persistent undo
function! Make_undodir()
  if version >= 703 && has('persistent_undo')
    set undofile
    set undodir=$HOME/.undodir/
    let l:dir= expand("$HOME/.undodir")
    if !isdirectory(l:dir)
      call mkdir(l:dir, "p")
    endif
  endif
endfunction
call Make_undodir()

"Enable/Disable IME
autocmd! InsertLeave * set imdisable
autocmd! InsertEnter * set noimdisable
noremap / :set noimdisable<cr>/

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
map <silent> <leader>t <esc>:TagbarToggle<cr>
let g:tagbar_sort=0

"EasyGrep
let EasyGrepMode=0
let EasyGrepRecursive=1

"gundo
if has('python')
  nmap <silent> <leader>u :GundoToggle<cr>
endif

"Vundle
filetype off

if has("win32")
  set rtp+=$VIM/vimfiles/bundle/vundle/
  call vundle#rc('$VIM/vimfiles/bundle')
elseif has("unix")
  set rtp+=$HOME/.vim/bundle/vundle/
  call vundle#rc()
endif

Bundle 'EasyGrep'
Bundle 'Mark--Karkat'
Bundle 'SirVer/ultisnips'
Bundle 'a.vim'
Bundle 'bufexplorer.zip'
Bundle 'cscope_macros.vim'
Bundle 'gmarik/vundle'
Bundle 'jsfaint/gen_tags.vim'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'
Bundle 'mbbill/fencview'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-speeddating'
Bundle 'xml.vim'
Bundle 'yegappan/mru'

if has("win32")
  Bundle 'vim-ycm'
endif

filetype plugin indent on
