

" Get Current Directory
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

"======================
" Environmental Settings
" ======================

" Set Mapleader 
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","

" Sets how many lines of history VIM can remember
set history=500

" Line Control
set linebreak
set nocompatible

" Tab Page
set tabpagemax=9
set showtabline=0

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Show line number and ruler
set number
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" Status bar
"set cmdheight=1 
"set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PATH]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set laststatus=2   " Always show the statusline
set wildmenu       " Enable command line completion

" Search
set hlsearch  " Highlight search things
set magic     " Set magic on, for regular expressions
set showmatch " Show matching bracets when text indicator is over them
set mat=2     " How many tenths of a second to blink
set incsearch
set ignorecase

" Tab
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" Show command keys in the status line
set showcmd 

" Indent
set autoindent
set smartindent
set wrap

" Set to auto read when a file is changed from the outside
set autoread

" Smart Backspace
set backspace=indent,eol,start

" Have the mouse enabled all the time
set mouse=a

" No Backup
set nobackup
set nowb
set noswapfile

" Omni Complete
set complete=.,w,b,k,t,i
set completeopt=menuone,menu,longest

" Code Folding
set foldmethod=indent
" Default no folding
set foldlevel=99



" ===========
" Multi-Bytes
" ===========
if has("multi_byte")
    set encoding=utf-8
    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " No Unicode BOM

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif



" ============
" Color Scheme
" ============
if has('syntax')
    if (has("gui_running"))
        colorscheme desert
    else
        colorscheme darkblue
    endif

    " Enable syntax highlight
    syntax on
endif



" =========
" GUI
" =========
if has('gui_running')
    " Highlight the cursor
    set cursorline

    " Number of pixel lines to use between characters
    set linespace=2

    " Under Linux/Unix etc.
    if has("unix") && !has('mac')
        set guifont=Courier\ 10\ Pitch\ 11
    endif

    " Under the Mac(MacVim)
    if has("mac")
        " Set the font in MacVim
        set guifont=Monaco:h14

        " Windows size and transparency
        set lines=200 columns=240
        set transparency=2

        " Use Native Fullscreen of MacVim
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

        set guioptions-=m
        set guioptions-=T

        " Toggle to Fullscreen
        map <leader>ff  :call FullScreenToggle()<CR>

        " Set input method off
        set imdisable
    endif
endif



" =========
" AutoCmd
" =========
if has("autocmd")
    filetype plugin indent on

    " Set fileformat to UNIX
    au FileType php,javascript,phtml,html,css,python,vim,vimwiki set fileformat=unix

    " Python Support
    au FileType python set makeprg="python -u %"

    " JavaScript Support
    au BufRead,BufNewFile *.js set filetype=javascript
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    au FileType tpl,phtml,html,htm,javascript let g:javascript_enable_domhtmlcss = 1

    " PHP Support
    au BufNewFile,BufRead *.php set filetype=php
    au FileType php set omnifunc=phpcomplete#CompletePHP
    let php_sql_query=1
    let php_htmlInStrings=1

    " CSS3 Syntax Highlight
    au BufRead,BufNewFile *.css set filetype=css syntax=css3

    " HTML Syntax Highlight
    au BufNewFile,BufRead *.htm set filetype=html
    au BufNewFile,BufRead *.html set filetype=html
    au BufNewFile,BufRead *.phtml set filetype=html
    au BufNewFile,BufRead *.tpl set filetype=html
endif



" =========
" Plugins
" =========

" Vundle
"filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'AutoComplPop'
Bundle 'DoxygenToolkit.vim'
Bundle 'OmniCppComplete'
Bundle 'tomtom/checksyntax_vim'
Bundle 'grep.vim'
Bundle 'matchit.zip'
Bundle 'minibufexpl.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'python.vim--Vasiliev'
Bundle 'python_fold'
Bundle 'msanders/snipmate.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'taglist.vim'
Bundle 'kana/vim-fakeclip.git'
Bundle 'nvie/vim-flake8.git'
Bundle 'pangloss/vim-javascript.git'
Bundle 'uguu-org/vim-matrix-screensaver.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'winmanager--Fox'


" Flake8
autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="E501"


" Tagbar
map <silent><leader>b :TagbarToggle<CR>


" Taglist
set tags=./tags

let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_php_settings = 'php;c:class;f:function;d:constant'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0


" Doxygen Toolkit
let g:DoxygenToolkit_authorName="Qingyuan Zhang"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc $a<TAB><TAB><TAB><TAB><TAB>/**  */<Left><Left><Left>


" WinManager
let g:NERDTree_title='[NERD Tree]'
let g:winManagerWindowLayout='NERDTree'
let g:winManagerWidth = 30
let g:defaultExplorer = 0

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

map <leader>t :WMToggle<CR>


" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne = 1


" Grep
let Grep_Default_Filelist = '*.cpp *.h *.c *.php *.js *.css *.html *.phtml *.py *.rb'


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

let g:neocomplcache_enable_at_startup = 1


" =================
" Keyboard Bindings
" =================
map <silent> <F8> :A<CR>
map <silent> <F11> :cw<CR> 
map <silent> <leader>f :Grep<CR>
map <silent> <leader>M :Matrix<CR>
map <silent> <leader>m :make<CR>:cw<CR>
map <silent> <leader>n :noh<CR>
map <silent> <leader>w :w<CR>
map <silent> <leader>q :qall<CR>
map <silent> <leader>y "+y
map <silent> <leader>p "+p
map <silent> <leader>cd :cd %:p:h<CR>
map <C-p> :cp<CR>
map <C-n> :cn<CR>
map J <C-d>
map K <C-u>
map H <C-S-Tab>
map L <C-Tab>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"