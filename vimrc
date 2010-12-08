
" Pathogen - isolates all plugins inside ~/.vim/bundle
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

"Key Bindings
let mapleader = ","

" Edit .vimrc
map <Leader>v :e $MYVIMRC<CR>

" Tab cycles buffers
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

" Toggle line wrap
map <Leader>w :set wrap!<CR>

" Toggle paste mode
map <Leader>p :set paste!<CR>

" Toggle highlight search
map <Leader>h :set hls!<CR>

" Easier way of starting find/replace
map <Leader>s :s/
map <Leader>S :%s/

" Run scripts with Cmd-R
map <D-r> :!./%<CR>

" Run python programs with leader-P
"map <Leader>p :!/usr/bin/python %<CR>

" Fuzzy Finder
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>

" NERDtree
map <Leader>t :NERDTreeToggle<CR>

" New scratch buffer
map <Leader>n :Sscratch<CR>
map <Leader>N :Scratch<CR>

" Crontab hijinks
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
set backupskip=/tmp/*,/private/tmp/*


if has('python')
python << EOF
# Setup Django for model completion
import sys, os
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

# Other site packages
sys.path.append('/opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages')

EOF
endif

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
au BufNewFile,BufRead *.txt set textwidth=80
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType rst set textwidth=80
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 

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
    colorscheme delek
    highlight Comment ctermfg=green
endif

" Project
let g:proj_window_width=32

" Project stuff
"hi FadedText guifg=#111111

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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
map j gj
map k gk
if exists('&autochdir')
    set autochdir
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
set foldmethod=manual
set foldnestmax=1
set nowrap
set bs=indent,eol,start
set laststatus=2
set history=500

" No backups for temp files
set backupskip=/tmp/*,/private/tmp/*" 

" Make - and _ part of a word
set iskeyword+=-
set iskeyword+=_


" Alter default colorscheme highlighting
"hi VertSplit guibg=#222222 guifg=#333333
"hi Folded guibg=Grey20 guifg=Grey80
"hi Normal ctermfg=grey ctermbg=black
"hi Visual ctermfg=green ctermbg=black
"hi Search term=reverse cterm=standout ctermfg=green ctermbg=yellow
"hi IncSearch term=reverse cterm=standout ctermfg=green ctermbg=yellow
"hi PmenuSel ctermbg=Green ctermfg=Yellow

if has('python')
python << EOF
sys.path += ['/opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/aeosa']
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
map <Leader>pr :python processing_run()<CR>









