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
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'jsfaint/gen_tags.vim'
NeoBundle 'lendyzhang/vim-emax'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'matchit.zip'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mbbill/fencview'
NeoBundle 'mbbill/undotree'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shougo/vimproc.vim', {'build': {'unix': 'make -f make_unix.mak', 'mac': 'make -f make_mac.mak'}}
NeoBundle 'shougo/vinarise.vim', {'vim_version': '7.3'}
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'yggdroot/indentLine'

if has('unix')
  NeoBundle 'sirver/ultisnips', {'depends': 'honza/vim-snippets', 'vim_version': '7.3.584'}
  NeoBundle 'tdcdev/ycm_simple_conf', {'depends': 'valloric/youcompleteme', 'vim_version': '7.3.584'}
  NeoBundle 'valloric/youcompleteme', {'vim_version': '7.3.584'}
elseif has('win32')
  NeoBundle 'osyo-manga/vim-marching', {'depends': 'shougo/vimproc.vim'}
  NeoBundle 'shougo/neocomplete', {'disabled': !has('lua')}
  NeoBundle 'shougo/neosnippet', {'depends': 'shougo/neosnippet-snippets', 'disabled': !has('lua')}
  NeoBundle 'davidhalter/jedi-vim'
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
set tabstop=4
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

"Remove trailing
nmap <leader>i :%s/\s*$//g<CR>:noh<CR>

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
let g:alternateNoDefaultAlternate = 1
nmap <leader>a :A<cr>

"tagbar
map <silent> <Leader>t <esc>:TagbarToggle<CR>
let g:tagbar_sort=0
let g:tagbar_left=1
let g:tagbar_compact=1

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

  "vim-marching
  let g:marching_enable_neocomplete = 1
  let g:marching_enable_auto_select = 1
  let g:marching_include_paths = [
        \ "C:/Program Files (x86)/LLVM/include"
        \]
endif

"CtrlP
let g:ctrlp_mruf_relative = 1
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_clear_cache_on_exit = 1
else
  let g:ctrlp_clear_cache_on_exit = 0
endif

"YouCompleteMe
if has('unix') && (v:version > 703 || (v:version == 703 && has('patch584')))
  let g:ycm_key_list_select_completion = ['<Enter>', '<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_seed_identifiers_with_syntax = 1
  autocmd FileType c,cpp,objc,objcpp,python,cs,go nnoremap <leader>j :YcmCompleter GoTo<CR>
endif

"Mark
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoLoadMarks = 1
let g:mwAutoSaveMarks = 1
set viminfo+=! "Save and restore global vriables

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"undotree
nmap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2

"Nerdtree
nmap <leader>nt :NERDTreeToggle<CR>

"CtrlSF
nmap <leader>V <Plug>CtrlSFPrompt
vmap <leader>vv <Plug>CtrlSFVwordExec
nmap <leader>vv <Plug>CtrlSFCwordExec
nnoremap <leader>vo :CtrlSFToggle<CR>

"tern
autocmd FileType javascript nnoremap <leader>j :TernDef<CR>
