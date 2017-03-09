"""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键：
"""""""""""""""""""""""""""""""""""""""""""""""
" 在插入模式中<ESC>映射为"kj"键
"
" C-e 打开NerdTree
" C-N 下一个Buffer
" C-P 上一个Buffer
" C-]查看函数原型
" C-t回到原处
"
" <Leader>映射为","键
" <Leader>tt 打开TagBar
"
" F1为中文帮助文件
" F2为Syntastic的开关
" F3为显示YCM错误列表
" F4为修补python代码风格错误
" F9为编译运行C++，运行结束后会删除可执行文件
" F10为运行python
" F12为生成Tag文件




"""""""""""""""""""""""""""""""""""""""""""""""
" Normal Configure

"""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
inoremap kj <ESC>
syntax on
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8
set fileformat=unix
set nu
set shiftwidth=4
set tabstop=4
set cindent
set smarttab
set mouse=a
set ruler
set autoindent
set hlsearch 
set wrap
set backspace=2 

map <F9> :call CR()<CR>
func! CR()
exec "w"
exec "!g++ % -o %< -D LOCAL -g"
exec "! %<"
exec "!del %<.exe"
endfunc

map <F10> :call CR()<CR>
func! CR()
exec "w"
exec "!python %<.py"
endfunc



"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of Vundle:

"""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:/Users/ghzha/vimfiles/bundle/Vundle.vim/
call vundle#begin('C:/Users/ghzha/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""
"My own Plugins:

"""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'yianwillis/vimcdoc'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'jnurmine/Zenburn'
Plugin 'godlygeek/tabular'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'


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



"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of ColorsCheme:

"""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set guifont=Inconsolata_for_Powerline:h18
	au GUIEnter * simalt ~x " 窗口启动时自动最大化
	set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	set guioptions-=r " 隐藏右侧滚动条
	set guioptions-=b " 隐藏底部滚动条
	set showtabline=0 " 隐藏Tab栏
	set background=dark
	colorscheme solarized
else
	colorscheme Zenburn
endif



"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of airline:

"""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_theme="solarized" 

"安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

"打开tabline功能,方便查看、切换Buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>


"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of Nerdtree:

"""""""""""""""""""""""""""""""""""""""""""""""
map <C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let NERDTreeSortOrder=['\.cpp$', '\.c$', '\.h$']
let NERDTreeIgnore=['\.lnk$', '\~$' , '\.vim$']




"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of Tagbar:

"""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>tt :TagbarToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of Nerdcommenter:

"""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1






"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of syntastic:

"""""""""""""""""""""""""""""""""""""""""""""""


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
map <F2> :SyntasticToggleMode<CR>



"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of ctags:

"""""""""""""""""""""""""""""""""""""""""""""""

map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  


"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of YouCompleteMe:

"""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = 'C:\Users\ghzha\vimfiles\bundle\YouCompleteMe\third_party\ycmd\cpp\ycm\.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
nmap <F3> :YcmDiags<CR>
"YcmForceCompileAndDiagnostics"  
"YcmDebugInfo  
let g:ycm_confirm_extra_conf = 0  
" 语法关键字补全  
let g:ycm_seed_identifiers_with_syntax = 1  
""补全之后自动关闭preview  
let g:ycm_autoclose_preview_window_after_completion = 1  
""允许在字符串里补全（双引号）  
let g:ycm_complete_in_strings = 1  
" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1  
" 在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
set completeopt=longest,menu  
" 离开插入模式后自动关闭预览窗口  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif  
" 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_cache_omnifunc=0  
""错误  
let g:ycm_error_symbol = '>>'  
""警告  
let g:ycm_warning_symbol = '>*'  




"""""""""""""""""""""""""""""""""""""""""""""""
"Configure of PyMode:

"""""""""""""""""""""""""""""""""""""""""""""""

let g:pymode_indent = 1
let g:pymode_run = 1
let g:pymode_folding = 1
nnoremap <F4> :PymodeLintAuto<CR>