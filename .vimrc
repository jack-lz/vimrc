" 设置文件编码

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

set mouse=a

syntax on
" 设置颜色
color darkblue
set cursorline
" set cursorcolumn

set incsearch
set ignorecase
set smartcase
"设置保持历史记录10000
set history=10000
set nofoldenable
set confirm
set backspace=indent,eol,start
set t_Co=256
set report=0
set nowrap
set scrolloff=5
set number
set ruler
set showmatch
set showcmd
set title
set laststatus=2
set matchtime=2
set matchpairs+=<:>

" 设置文件不备份，这里被注释掉；
"          set nobackup
"          set noundofile
"          set noswapfile
set backupext=.bak
set backupdir=~/.vim/vim_bak/

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
"set textwidth=120
"set colorcolumn=+1

set autoread
set autowrite

"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/calendar-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
"Plugin 'lervag/vimtex'
Plugin 'sirver/ultisnips'
Plugin 'pboettch/vim-cmake-syntax'
"Plugin 'Valloric/YoucompleteMe'
"Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'EasyGrep'
"Plugin 'scrooloose/syntastic'
Plugin 'Valloric/ListToggle'
Plugin 'bling/vim-airline'
" for python
"Plugin 'maralla/completor.vim'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
"Plugin 'lervag/vimtex'
Plugin 'tpope/vim-fugitive'
"Plugin 'EditPlus'
"Plugin 'cst'
"Plugin 'Xdebug'
"Plugin 'PyChimp'
Plugin 'snipMate'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on

"设置日历方面
let g:calendar_diary="/mnt/c/Users/mydai/diary/"
let g:calendar_focus_today=1
"let g:ackprg='ag --nogroup --nocolor --column'

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mod=0
set conceallevel=1

" YouCompleteme config:fedora 27 and later:
"      sudo dnf install cmake gcc g++ make python3-devel
" Compiling YCM with semantic support for C-family languages through libclang;
"      cd ~/.vim/bundle/youcompleteme
"      python3 install.py --clang-completer
" YCM Configuration notes:
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_python_binary_path='python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger=1


" pip3 install jedi
" 为了Python3的第三方库安装Jedi插件
" Plugin 'davidhalter/jedi-vim'
"===============================Jedi==================================
if has('python3')
let g:loaded_youcompleteme = 1 " 判断如果是python3的话，就禁用ycmd。
let g:jedi#force_py_version = 3
let g:pymode_python = 'python3'
endif
"===============================Jedi===================================
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"vim打开文件，光标定位到上次退出的位置；
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif"`'")"'")

set paste " 设置可粘贴模式

" set runtimepath^=~/.vim/bundle/ag

