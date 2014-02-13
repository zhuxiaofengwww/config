

" Get Current Directory
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

"======================
" Environmental Settings
" ======================

" Set Mapleader
let mapleader=","

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
set t_vb =

" Show line number and ruler
set number
set ruler

" Status bar
set laststatus=2 " Always show the statusline
set wildmenu       " Enable command line completion

" Search
set hlsearch      " Highlight search things
set magic         " Set magic on, for regular expressions
set showmatch     " Show matching bracets when text indicator is over them
set matchtime=2 " How many tenths of a second to blink
set incsearch
set ignorecase
set smartcase

" Tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

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
set nowritebackup
set noswapfile

" Omni Complete
set complete=.,w,b,k,t,i
set completeopt=menuone,menu,longest

" Code Folding
set foldmethod=indent
set foldlevel=99 " Default no folding



" ===========
" Multi-Bytes
" ===========
if has("multi_byte")
    set encoding=utf-8
    set fileencodings=utf-8,gbk,chinese,latin1
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

    " Hightlight Trailing whitespace
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/

endif

set colorcolumn=80
highlight ColorColumn guibg=slategrey
set t_Co=256

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
            set fullscreen
        endf

        func! FullScreenLeave()
            let &lines=s:lines
            let &columns=s:columns
            set nofullscreen
        endf

        func! FullScreenToggle()
            if &fullscreen
                call FullScreenLeave()
            else
                call FullScreenEnter()
            endif
        endf

        " Toggle to Fullscreen
        map <leader>ff :call FullScreenToggle()<CR>

        set guioptions-=m
        set guioptions-=T

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
    autocmd FileType php,javascript,uhtml,phtml,html,css,python,vim,vimwiki,jade,coffee set fileformat=unix

    " C++ Support
    "autocmd FileType cpp set tags+=~/.vim/tags/cpp
    set tags+=~/.vim/tags/cpp

    " Python Support
    autocmd FileType python set makeprg="python -u %"
    autocmd FileType python imap <silent> <buffer> . .<C-X><C-O>
    autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4

    " JavaScript Support
    autocmd BufRead,BufNewFile *.js set filetype=javascript
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType tpl,uhtml,phtml,html,htm,javascript let g:javascript_enable_domhtmlcss=1

    " Jade Support
    autocmd BufRead,BufNewFile *.jade set filetype=jade syntax=jade

    " CoffeeScript Support
    autocmd BufRead,BufNewFile *.coffee set filetype=coffee syntax=coffee

    " PHP Support
    autocmd BufNewFile,BufRead *.php set filetype=php
    autocmd FileType php set omnifunc =phpcomplete#CompletePHP
    autocmd FileType php set tabstop=4 shiftwidth=4 softtabstop=4

    let php_sql_query=1
    let php_htmlInStrings=1

    " CSS3 Syntax Highlight
    autocmd BufRead,BufNewFile *.css set filetype=css syntax=css3

    " HTML Syntax Highlight
    autocmd BufNewFile,BufRead *.htm set filetype=html
    autocmd BufNewFile,BufRead *.html set filetype=html
    autocmd BufNewFile,BufRead *.uhtml set filetype=html
    autocmd BufNewFile,BufRead *.phtml set filetype=html
    autocmd BufNewFile,BufRead *.tpl set filetype=html

    " Web Development Indentation
    autocmd FileType tpl,uhtml,phtml,html,htm,javascript,coffee,css set tabstop=2 shiftwidth=2 softtabstop=2

endif



" =========
" Plugins
" =========

" Vundle
"filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'miccrun/AutoComplPop'
Bundle 'DoxygenToolkit.vim'
Bundle 'OmniCppComplete'
Bundle 'miccrun/checksyntax_vim'
Bundle 'grep.vim'
Bundle 'matchit.zip'
Bundle 'minibufexpl.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'python.vim--Vasiliev'
Bundle 'python_fold'
Bundle 'miccrun/snipmate.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'taglist.vim'
Bundle 'kana/vim-fakeclip.git'
Bundle 'nvie/vim-flake8.git'
Bundle 'pangloss/vim-javascript.git'
Bundle 'uguu-org/vim-matrix-screensaver.git'
Bundle 'Lokaltog/powerline.git'
Bundle 'miccrun/winmanager--Fox'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim.git'
Bundle 'indexer.tar.gz'
Bundle 'vimprj'
Bundle 'DfrankUtil'
Bundle 'godlygeek/tabular.git'
Bundle 'shawncplus/phpcomplete.vim.git'
Bundle 'digitaltoad/vim-jade.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'


" Flake8
autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="E123,E126,E127,E128,E221,E501"


" Tagbar
map <silent><leader>b :TagbarToggle<CR>


" Taglist
let Tlist_Ctags_Cmd               = '/usr/bin/ctags'
let Tlist_php_settings            = 'php;c:class;f:function;d:constant'
let Tlist_File_Fold_Auto_Close    = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth                = 40
let Tlist_Show_One_File           = 1
let Tlist_Exit_OnlyWindow         = 1
let Tlist_Use_Right_Window        = 0


" Doxygen Toolkit
let g:DoxygenToolkit_authorName        = "Qingyuan Zhang (miccrun@gmail.com)"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:doxygen_enhanced_color           = 1

map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc $a<TAB><TAB><TAB><TAB><TAB>/**  */<Left><Left><Left>


" WinManager
let g:NERDTree_title         = '[NERD Tree]'
let g:winManagerWindowLayout = 'NERDTree'
let g:winManagerWidth        = 40
let g:defaultExplorer        = 0

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

map <leader>t :WMToggle<CR>


" MiniBufExplorer
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1
let g:miniBufExplMoreThanOne        = 1


" Grep
let Grep_Default_Filelist = '*.cpp *.h *.c *.php *.js *.css *.html *.phtml *.py *.rb'


" OmniCppComplete
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black


" CtrlP
let g:ctrlp_map           = '<C-o>'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore            +=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
map <C-i> :CtrlPMRU<CR>

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']



" =================
" Keyboard Bindings
" =================
map <silent> <leader>T  :TagbarToggle<CR>
map <silent> <leader>f  :Rgrep<CR>
map <silent> <leader>M  :Matrix<CR>
map <silent> <leader>m  :make<CR>:cw<CR>
map <silent> <leader>n  :noh<CR>
map <silent> <leader>l  :set list!<CR>
map <silent> <leader>w  :w<CR>
map <silent> <leader>q  :qall<CR>
map <silent> <leader>y  "+y
map <silent> <leader>p  "+p
map <silent> <leader>cd :cd %:p:h<CR>
map <silent> <leader>dd :bdelete<CR>
map <silent> <leader>ef :CtrlP<CR>
map <silent> <leader>et :CtrlPBuffer<CR>
map <silent> <leader>er :CtrlPMRU<CR>
map <silent> <leader>ee :Tabularize /=<CR>
map <C-p> :cp<CR>
map <C-n> :cn<CR>
map J <C-d>
map K <C-u>
map H <C-S-Tab>
map L <C-Tab>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
