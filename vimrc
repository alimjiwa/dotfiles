
" Pathogen - isolates all plugins inside ~/.vim/bundle
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

"Key Bindings
let mapleader = ","

" Edit .vimrc
map <Leader>vv :tabe $MYVIMRC<CR>

" [Shift]-Tab cycles tabs
map <Tab> :tabn<CR>
map <S-Tab> :tabp<CR>
map <D-Right> :tabn<CR>
map <D-Left> :tabp<CR>

" Option/Alt-Left/Right cycles buffers
au VimEnter * map <A-Right> :bn<CR> | map <A-Left> :bp<CR>

" Ctrl-Space is omni-completion
inoremap <Nul> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" Toggle line wrap
map <Leader>w :set wrap!<CR>

" Toggle paste mode
map <Leader>pp :set paste!<CR>

" Toggle highlight search
map <Leader>h :set hls!<CR>

" Easier way of starting find/replace
map <Leader>s :s/
map <Leader>S :%s/

" Run scripts with Cmd-R
map <D-r> :!./%<CR>

" Run python programs with leader-P
map <Leader>p :!/usr/bin/python %<CR>

" Fuzzy Finder
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>

" Tag list
map <Leader>T :Tlist<CR>
let Tlist_Close_On_Select=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=1

" NERDtree
map <Leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Tasks
let g:tlWindowPosition = 1
map <Leader>X <Plug>TaskList

" New scratch buffer
map <Leader>n :Sscratch<CR>
map <Leader>N :Scratch<CR>

" Crontab hijinks
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
set backupskip=/tmp/*,/private/tmp/*

" Python scripting
if has('python')
python << EOF
import sys, os, vim
import ropevim

# Setup Django for model completion
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

# Add Python paths to vim path to open with `gf`
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# Evaluate Python code under cursor
def EvaluateCurrentRange(): 
    eval(compile('\n'.join(vim.current.range),'','exec'),globals()) 

EOF
map <C-h> :py EvaluateCurrentRange()<CR>
endif

" Add generated Python library tags
set tags+=$HOME/.vim/tags/python.ctags

" Snippets
if has('gui_running')
let g:snippetsEmu_key = "<C-Tab>"
else
let g:snippetsEmu_key = "<C-S-Tab>"
endif

" Autocommands and filetype detection
"au BufReadPost *.project bd | Project <afile>:p
au BufReadPost *.less set ft=less
au BufReadPost buildfile set ft=ruby
au BufNewFile,BufRead *.pde	setf arduino
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm setf htmldjango
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType rst set textwidth=80
autocmd FileType txt set textwidth=80
autocmd FileType markdown set textwidth=80
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
autocmd FileType python set omnifunc=pythoncomplete#Complete

" :make for Python
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 

" Commands
command! -nargs=* W write <args>
command! -nargs=0 Q quit

if has('gui_running')
    colorscheme wombat
    set background=dark
    set lines=50
    set columns=90
    "set guifont=Inconsolata:h14
    set guifont=Droid\ Sans\ Mono:h14
    set selectmode=mouse,key
    set guioptions=egmt
else
    set t_Co=256
    "colorscheme delek
    colorscheme wombat256mod
endif

" Project
let g:proj_window_width=32

" HTML stuff ( get rid of shitty underlining )
hi! link htmlLink Normal

" PHP stuff
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_parent_error_close = 1
let php_parent_error_open = 1

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
map j gj
map k gk
if exists('&autochdir')
    set autochdir
endif
if exists('&colorcolumn')
    set colorcolumn=80
endif
set noautoread
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set smartcase " Do smart case matching
"set incsearch " Incremental search
"set autowrite " Automatically save before commands like :next and :make
set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes)
syntax on
set textwidth=0
set visualbell
set softtabstop=4
set expandtab
set shiftwidth=4
set tabstop=4
set nobackup
set smartindent
set cindent
set autoindent
set showcmd
set noswapfile
"set hlsearch
"set incsearch
set viminfo+=h
set nocp
filetype plugin on
set switchbuf=useopen,usetab
"set foldmethod=manual
set foldmethod=marker
set foldnestmax=1
set nowrap
set bs=indent,eol,start
set laststatus=2
set history=500
set completeopt=menu,menuone

" Split windows open above and to the right
set splitright
set nosplitbelow

" No backups for temp files
set backupskip=/tmp/*,/private/tmp/*" 

" Make - and _ part of a word
set iskeyword+=-
set iskeyword+=_

if has('python')
python << EOF
from appscript import *
import vim
from time import sleep

def arduino_upload():
    app('Arduino').activate()
    arduino = app('System Events').application_processes['Arduino']
    arduino.menu_bars[1].menu_bar_items["File"].menus[1].menu_items['Upload to I/O Board'].click()

def arduino_compile():
    app('Arduino').activate()
    arduino = app('System Events').application_processes['Arduino']
    arduino.menu_bars[1].menu_bar_items["Sketch"].menus[1].menu_items['Verify / Compile'].click()

def processing_run():
    app('Processing').activate()
    processing = app('System Events').application_processes['Processing']
    processing.menu_bars[1].menu_bar_items["Sketch"].menus[1].menu_items['Run'].click()

EOF
endif

command! ArduinoUpload python arduino_upload()
command! ArduinoCompile python arduino_compile()
command! ProcessingRun python processing_run()

map <Leader>ac :python arduino_compile()<CR>
map <Leader>au :python arduino_upload()<CR>









