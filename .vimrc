" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" =========
" 环境配置
" =========

" 设定 mapleader 
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","

" 保留历史记录
set history=500

" 行控制
set linebreak
set nocompatible

" 标签页
set tabpagemax=9
set showtabline=0

" 控制台响铃
set noerrorbells
set novisualbell
set t_vb= "close visual bell

" 行号和标尺
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PATH]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " 始终显示状态行
set wildmenu "命令行补全以增强模式运行

" 搜索
set hlsearch  " Highlight search things
set magic     " Set magic on, for regular expressions
set showmatch " Show matching bracets when text indicator is over them
set mat=2     " How many tenths of a second to blink
set incsearch
set ignorecase

" 制表符
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 状态栏显示目前所执行的指令
set showcmd 

" 缩进
set autoindent
set smartindent
set wrap

" 自动重新读入
set autoread

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 设定在任何模式下鼠标都可用
set mouse=a

" 备份和缓存
set nobackup
set nowb
set noswapfile

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu

" 代码折叠
set foldmethod=marker

" =====================
" 多语言环境
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


" =============
" Color Scheme
" =============
if has('syntax')
    if (has("gui_running"))
        set guioptions-=m
        set guioptions-=T
        colorscheme desert
    else
        colorscheme darkblue
    endif

    " 保证语法高亮
    syntax on
endif


" =========
" AutoCmd
" =========
if has("autocmd")
    filetype plugin indent on

    " JavaScript 语法高亮
    au FileType tpl,phtml,html,javascript let g:javascript_enable_domhtmlcss = 1
    au BufRead,BufNewFile *.js setf jquery

    " 给各语言文件添加 Dict
    let s:dict_dir = $HOME."/.vim/dict/"
    let s:dict_dir = "setlocal dict+=".s:dict_dir

    au FileType php exec s:dict_dir."php_funclist.dict"
    au FileType css exec s:dict_dir."css.dict"
    au FileType javascript exec s:dict_dir."javascript.dict"

    " 格式化 JavaScript 文件
    "au FileType javascript map <f12> :call g:Jsbeautify()<CR>
    "au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    
    au FileType php set omnifunc=phpcomplete#CompletePHP
    let php_sql_query=1                                                                                        
    let php_htmlInStrings=1

    " CSS3 语法支持
    au BufRead,BufNewFile *.css set ft=css syntax=css3

    " LESS 语法支持
    au BufNewFile,BufRead *.less set filetype=less
    
    au BufNewFile,BufRead *.phtml set filetype=html
    au BufNewFile,BufRead *.tpl set filetype=html

    " 将指定文件的换行符转换成 UNIX 格式
    au FileType php,javascript,phtml,html,css,python,vim,vimwiki set ff=unix
    au FileType python set makeprg="python -u %"

    " JSON 语法高亮
    au! BufRead,BufNewFile *.json setfiletype json
endif


" =========
" 图形界面
" =========
if has('gui_running')
    " 高亮光标所在的行
    set cursorline

    " 设置行高
    set linespace=2

    " Under Linux/Unix etc.
    if has("unix") && !has('mac')
        set guifont=Courier\ 10\ Pitch\ 11
    endif

    " Under the Mac(MacVim)
    if has("mac")
        " 开启抗锯齿渲染
        set anti

        " MacVim 下的字体配置
        set guifont=Monaco:h14

        " 半透明和窗口大小
        set transparency=2
        set lines=200 columns=140

        " 使用 MacVim 原生的全屏幕功能
        let s:lines=&lines
        let s:columns=&columns

        func! FullScreenEnter()
            set lines=999 columns=999
            set fu
        endf

        func! FullScreenLeave()
            let &lines=s:lines
            let &columns=s:columns
            set nofu
        endf

        func! FullScreenToggle()
            if &fullscreen
                call FullScreenLeave()
            else
                call FullScreenEnter()
            endif
        endf

        "set guioptions+=e
        " Mac 下，按 <leader>ff 切换全屏
        nmap <leader>ff  :call FullScreenToggle()<CR>

        " Set input method off
        set imdisable

        " 如果为空文件，则自动设置当前目录
        lcd ~
    endif
endif


" =========
" 插件设置
" =========

" Netrw
let g:netrw_winsize = 35

" NERD_Commenter
let NERDShutUp=1

" Grep
let Grep_Default_Filelist = '*.cpp *.h *.php *.js *.css *.html *.phtml'

" Doxygen Toolkit
let g:DoxygenToolkit_authorName="Qingyuan Zhang"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

" Taglist
set tags=./tags

let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_php_settings = 'php;c:class;f:function;d:constant'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0         "在右侧窗口中显示taglist窗口 

" WinManager
let g:NERDTree_title='[NERD Tree]'
"let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWindowLayout='NERDTree'
let g:winManagerWidth = 40
let g:defaultExplorer = 0

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" SuperTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0  

" NeoComplCache
let g:neocomplcache_enable_at_startup=1   


" =========
" 键盘映射
" =========

nmap <silent> <F3> :Grep<CR>
nmap <silent> <F8> :A<CR>
nmap <silent> <F11> :cw<CR> 
nmap <silent> <leader>n :noh<CR>
nmap <silent> <leader>w :w<CR>
nmap <C-p> :cp<CR>
nmap <C-n> :cn<CR>
nmap J <C-d>
nmap K <C-u>

" Netrw
nmap <silent> <leader>fe :Sexplore!<CR> 

" NERDTree
nmap <silent> <leader>nt :NERDTreeToggle<cr>

" Doxygen Toolkit
map <F2>a :DoxAuthor<CR>
map <F2>f :Dox<CR>
map <F2>b :DoxBlock<CR>
map <F2>c $a<TAB><TAB><TAB><TAB><TAB>/**<  */<Left><Left><Left>

" WinManager
nmap <leader>t :WMToggle<CR>

nmap <silent> <leader>zz :set tags=~/Site/milee_v2/ctags;/usr/share/Zend/library/tags<CR>

