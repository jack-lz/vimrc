set nocompatible              " be iMproved, required
set mouse=a
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" install ag for global search
Plugin 'ag.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" cmake color
Plugin 'nickhutchinson/vim-cmake-syntax'

" add to vim-colorschemes
Plugin 'flazz/vim-colorschemes'

" cpp highlight addition
Plugin 'octol/vim-cpp-enhanced-highlight'

" air line for mulit file tag
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" add tagbar 
Plugin 'majutsushi/tagbar'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" <Normal Configuration>
" highlight CursorLine   cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE guifg=NONE
colorscheme molokai     " code color theme
set ic              " ignore case
set number          " show line number
set autoindent      " auto align
set ts=4            " tab width is 4 space
set expandtab       " replace tab to space
set nowrap          " no auto wrap
set hlsearch        " high light with key words when search it
set incsearch       " set search real time
" red（红），white（白），black（黑），green（绿），yellow（黄），blue（蓝），purple（紫），
" gray（灰），brown（棕），tan(褐色)，syan(青色)
" 更多高亮颜色设置, 可以:h highlight 查看manual
highlight Search term=inverse cterm=inverse guibg=NONE
highlight Cursorline cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE
" guifg=NONE
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" <NERDTree Configuration>
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
map <F3> :call CurtineIncSw()<CR>
map <F8> :Tagbar<CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
autocmd vimenter * NERDTree

" <Taglist configuration>
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口

" cpp highlight setting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

" <Ctrlp configuration>
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

