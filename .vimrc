" -*- coding: utf-8 -*-
" @file .vimrc
" @author lidongming@360.cn
" @date 2017-02-02 15:19
" @brief
"
"Set up Vundle First:
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype on                  " required
syntax on
syntax enable

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" original repos on github 
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'cfreebuf/vimcolors'
Plugin 'ccvext.vim'
Plugin 'cscope.vim'
Plugin 'ctags.vim'
Plugin 'sickill/vim-monokai'
Plugin 'octol/vim-cpp-enhanced-highlight'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"other config
set nu
set tabstop=2
let mapleader = ","  
let g:mapleader = ","  
map Y "+y  
map P "+p  ""

set autoindent                                        " 自动对齐
set smartindent                                       " 启用智能对齐方式
set expandtab                                         " Tab转化成空格 [输入Tab使用 Ctrl+V+Tab]
set tabstop=4                                         " 设置Tab键的宽度，可以更改，如：宽度为4
set shiftwidth=4                                      " 换行时自动缩进宽度

set t_Co=256
colorscheme monokai

set cursorline
" set cursorcolumn
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
" highlight CursorColumn cterm=NONE ctermbg=darkgray ctermfg=red guibg=bg guifg=red

set colorcolumn=80

" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&  b:NERDTreeType == "primary") | q | endif

"neocomplache config
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_enable_auto_select = 1

"nerdcomment config
let NERDSpaceDelims = 1

"easymotion
let g:EasyMotion_leader_key = '<Leader>'

"powerline config
set laststatus=2
set t_Co=256   
set encoding=utf-8  
set fillchars+=stl:\ ,stlnc:\

"cscope config
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
" g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
" d: 查找本函数调用的函数
" c: 查找调用本函数的函数
" t: 查找指定的字符串
" e: 查找egrep模式，相当于egrep功能，但查找速度快多了
" f: 查找并打开文件，类似vim的find功能
" i: 查找包含本文件的文

" macros
" \ev 编辑当前所使用的Vim配置文件
nmap <leader>ev <ESC>:vs $MYVIMRC<CR>
" \mt 在当前目录下递归生成tags文件
nmap <leader>mt <ESC>:!ctags -R --languages=
" \bb 按=号对齐代码 [Tabular插件]
nmap <leader>bb :Tab /=<CR>
" \bn 自定义对齐    [Tabular插件]
nmap <leader>bn :Tab /

" \rb 一键去除所有尾部空白
imap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>rb :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" \rm 一键去除字符
imap <leader>rm <ESC>:%s/<c-v><c-m>//g<CR>
nmap <leader>rm :%s/<c-v><c-m>//g<CR>
vmap <leader>rm <ESC>:%s/<c-v><c-m>//g<CR>
" \rt 一键替换全部Tab为空格
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/	/  /g"
    elseif &shiftwidth == 4
        exec "%s/	/    /g"
    elseif &shiftwidth == 6
        exec "%s/	/      /g"
    elseif &shiftwidth == 8
        exec "%s/	/        /g"
    else
        exec "%s/	/ /g"
    end
endfunc
imap <leader>rt <ESC>:call RemoveTabs()<CR>
nmap <leader>rt :call RemoveTabs()<CR>
vmap <leader>rt <ESC>:call RemoveTabs()<CR>

"将键盘上的F4功能键映射为添加作者信息的快捷键
" call append(0,"/** CopyRight 2015 360. All rights reserved.")
" call append(1,"# CopyRight 2015 360. All rights reserved.")
" map <F4> ms:call TitleDet()<cr>'s
nmap <leader>ah <ESC>ms:call TitleDet()<CR>
function AddHead()
    if &filetype == "cpp"
        call append(0,"// File   ".expand("%:t"))
        call append(1,"// Author lidongming@cmcm.com")
        call append(2,"// Date   ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(3,"// Brief")
        call append(4,"")
    elseif &filetype == "c"
        call append(0,"/**")
        call append(1," * @file   ".expand("%:t"))
        call append(2," * @author lidongming@360.cn")
        call append(3," * @date   ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(4," * @brief")
        call append(5," */")
        call append(6,"")
    else
        call append(0,"# -*- coding: utf-8 -*-")
        call append(1,"# @file ".expand("%:t"))
        call append(2,"# @author lidongming@360.cn")
        call append(3,"# @date ".strftime("%Y-%m-%d %H:%M"))
        call append(4,"# @brief")
        call append(5,"")
    endif
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

" map <F5> ms:call AddTail()<cr>'s
nmap <leader>at <ESC>ms:call AddTail()<CR>
function AddTail()
    call append(line("$"), "")
    if &filetype == "cpp"
        call append(line("$"), "/* vim: set expandtab ts=4 sw=4 sts=4 tw=100: */")
    else
        call append(line("$"), "# vim: set expandtab ts=4 sw=4 sts=4 tw=100:")
endf

"更新最近修改时间和文件名
normal m'
"execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
normal "
normal mk
"execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
execute "noh"
normal 'k
"
"判断前10行代码里面，是否有Last modified这个单词，
function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~'^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddHead()
endfunction

" vim-go custom mappings
"au FileType go nmap s (go-implements)
"au FileType go nmap i (go-info)
"au FileType go nmap gd (go-doc)
"au FileType go nmap gv (go-doc-vertical)
"au FileType go nmap r (go-run)
"au FileType go nmap b (go-build)
"au FileType go nmap t (go-test)
"au FileType go nmap c (go-coverage)
"au FileType go nmap ds (go-def-split)
"au FileType go nmap dv (go-def-vertical)
"au FileType go nmap dt (go-def-tab)
"au FileType go nmap e (go-rename)
" vim-go settings
let g:go_fmt_command = "goimports""

set tags=~/work/tags
set tags+=~/freebuf/elong_ihotel_as/tags

" highlight cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
