
" Root for most key bindings
let mapleader = ","

" Vundle setup
set rtp+=~/.vim/bundle/vundle/ 
source ~/.vim/bundle/vundle/autoload/vundle.vim
call vundle#rc()

" Allow comments after Bundle commands
command! -nargs=+ Load Bundle split(<q-args>)[0]

" Colorscheme plugins
Load 'altercation/vim-colors-solarized.git'
"Load 'vim-scripts/molokai.git'
"Load 'vim-scripts/desert256.vim.git'
"Load 'tpope/vim-vividchalk.git'
"Load 'vim-scripts/Wombat.git'
"Load 'vim-scripts/wombat256.vim.git'
"Load 'vim-scripts/Lucius.git'

" Other plugins
Load 'scrooloose/nerdcommenter.git' " Mappings for commenting
Load 'scrooloose/nerdtree.git' " Alternate file explorer
Load 'vim-scripts/Gundo.git' " Undo tree
Load 'kogakure/vim-sparkup' " Expands CSS-like selectors into HTML
Load 'vim-scripts/SuperTab-continued..git' " Better completion with Tab
Load 'vim-scripts/ReplaceWithRegister.git' " Replace without losing register contents
Load 'vim-scripts/cocoa.vim'
Load 'vim-scripts/Conque-Shell.git' " Open command-line shells in Vim splits
Load 'vim-scripts/vim-indent-object.git'
Load 'vim-scripts/OOP-javascript-indentation.git'
Load 'vim-scripts/Jinja'
Load 'vim-scripts/less.vim.git'
Load 'vim-scripts/Markdown.git'
Load 'vim-scripts/narrow--Kramer.git' " Narrow buffer temporarily
Load 'vim-scripts/Processing.git'
Load 'vim-scripts/TaskList.vim.git' " Collects all TODO and FIXME comments in a list
Load 'kchmck/vim-coffee-script.git'
Load 'godlygeek/tabular.git'  " Align text blocks with :Tabularize /pattern
Load 'duff/vim-scratch.git'   " Create temporary scratch buffers with :Scratch
Load 'tpope/vim-repeat.git'   " Repeats complex actions
Load 'tpope/vim-surround.git' " Mappings for surrounding text with stuff
Load 'tpope/vim-abolish.git'  " Smart case subsitute with :Subvert/Pattern/Repl/
Load 'tpope/vim-ragtag.git'   " Bindings for HTML tags
Load 'tpope/vim-fugitive.git' " Git wrapper
Load 'vim-scripts/JSON.vim.git'
Load 'wookiehangover/jshint.vim.git' " Runs JSHint in the background and highlights errors
Load 'vim-scripts/AutoTag' " Auto-closes HTML tags
Load 'ap/vim-css-color' " Highlights CSS colors with their real color
Load 'Raimondi/delimitMate' " Auto-closes brackets and other delimiters
Load 'majutsushi/tagbar' " Tag list plugin that uses ctags to show variables, classes, methods, etc.
Load 'juvenn/mustache.vim'
Load 'robbles/browserprint'
Load 'vim-scripts/Command-T'
"Load 'jceb/vim-orgmode'
"Load 'vim-scripts/VimClojure'

" Use <Leader>h[N] to create on-the-fly highlights
nnoremap <silent> <leader>hh :execute 'match Special /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match Special /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match Special /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match Special /\<<c-r><c-w>\>/'<cr>


if has('python')
    Load 'vim-scripts/pyflakes.vim.git'
endif

" Edit .vimrc in a new tab
map <Leader>V :tabe $MYVIMRC<CR>

" Eye candy
if has('gui_running')
    "colorscheme molokai
    "colorscheme wombat
    "colorscheme lucius
    colorscheme fruity
    set background=dark

    " Customize startup size.
    if !exists('g:sized_window')
        "set lines=50
        set columns=90
        let g:sized_window=1
    endif

    "set guifont=Inconsolata:h14
    set guifont=Droid\ Sans\ Mono:h14
    set selectmode=mouse,key

    " Scrollbars are for the weak-willed, use Ctrl-g instead
    set guioptions=egmt
else
    set background=dark
    colorscheme solarized
endif


" Better completion in command-line
"set wildmode=longest:full " only complete longest match
set wildchar=<Tab> wildmenu wildmode=full

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" [Shift]-Tab cycles tabs
map <Tab> :tabn<CR>
map <S-Tab> :tabp<CR>
map <D-Right> :tabn<CR>
map <D-Left> :tabp<CR>

" Option/Alt-Left/Right cycles buffers
au VimEnter * map <A-Right> :bn<CR> | map <A-Left> :bp<CR>

" Toggle line wrap
map <Leader>W :set wrap!<CR>

" Toggle paste mode
map <Leader>pp :set paste!<CR>

" Toggle highlight search
map <Leader>h :set hls!<CR>

" Toggle whitespace symbols
nmap <leader>l :set list!<CR>

" Toggle relative line numbers
nmap <leader>r :set relativenumber!<CR>

" Easier way of starting substitute
map <Leader>s :s/
map <Leader>S :%s/

" Tame the quickfix window (open/close using ,q)
nmap <silent> <leader>q :QFix<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

" Who needs Shift, anyway?
nnoremap ; :

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Run scripts with Cmd-R
map <D-r> :!./%<CR>

" Tag list
map <Leader>T :TagbarOpenAutoClose<CR>

" Avoid bug in supertab with long lines by disabling <CR> mappings
let g:SuperTabCrMapping=0
" Make Supertab adjust completion type based on preceding context
" Don't change this, it's bad ass
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-p>"

" NERDtree
map <Leader>f :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Gundo
map <Leader>g :GundoToggle<CR>
let g:gundo_help=0

" ConqueTerm
let g:ConqueTerm_ToggleKey = '<F8>'
let g:ConqueTerm_Color = 1
let g:ConqueTerm_TERM = 'xterm-256'
let g:ConqueTerm_Syntax = 'bash'
let g:ConqueTerm_CloseOnEnd = 1

" Tasks
let g:tlWindowPosition = 1
map <Leader>X <Plug>TaskList

" New scratch buffer for notes
map <Leader>n :Sscratch<CR>
map <Leader>N :Scratch<CR>

" Surround mappings for Django templates
let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
let g:surround_{char2nr("F")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"

" delimitMate
let g:delimitMate_expand_space=0
let g:delimitMate_expand_cr=1
imap <S-Tab> <Plug>delimitMateS-Tab
imap <C-Tab> <Plug>delimitMateS-Tab
"let g:delimitMate_smart_matchpairs='[(){}\[\]"'']'

" Map ,F to toggle indent folding
map <leader>F :set foldenable!<CR>

" Make command-line mimic bash-style shortcuts
cmap <C-a> <C-b>

" Stop annoying auto-indenting of comment/includes
inoremap # X<BS>#

" Crontab hijinks (prevents error when using "crontab -e")
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
set backupskip=/tmp/*,/private/tmp/*

" How to keep your sanity when editing long text sentences in Vim
map j gj
map k gk


"""""""""""""  Python Code """"""""""""""""""""
if has('python')
python << EOF
import sys, os, vim, re
try:
    import ropevim
except:
    pass

# Setup Django for model completion
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

# Evaluate Python code under cursor
def ExecCurrentRange(): 
    eval(compile('\n'.join(vim.current.range),'','exec'),globals()) 

def EvaluateCurrentRange(): 
    result = eval(compile('\n'.join(vim.current.range),'','eval'),globals()) 
    vim.current.line = str(result)

# Add the virtualenv's site-packages to vim path
import vim
if os.environ.get('VIRTUAL_ENV'):
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))

# Open the file referenced by an import statement
def LoadImportedFile():
    source, imports = vim.current.line.split('import')
    if source:
        # from x.y import z
        source = source.split('from ')[1].replace(' ', '')
        module = __import__(source, fromlist=[''])
    else:
        # import x.y
        module = __import__(imports.replace(' ', ''))
    path = module.__file__.replace('.pyc', '.py')
    print 'Found path: %s' % path

    # Edit file in a new tab
    vim.command('tabe %s' % path.replace(' ', '\\ '))

EOF

" Evaluate current range as python
map <C-h> :py ExecCurrentRange()<CR>
map <C-e> :py EvaluateCurrentRange()<CR>

" Load the python import on this line
command! LoadImportedFile py LoadImportedFile()

endif
"""""""""""""  /Python Code  """""""""""""""""""

" snipMate snippets
let g:snips_author = "Rob O'Dwyer"

" Really handy if you often end up doing :W by accident
command! -nargs=* W write <args>
command! -nargs=0 Q quit

" Autocommands and filetype detection
"au BufReadPost *.project bd | Project <afile>:p
au BufReadPost *.json set ft=json
au BufReadPost *.less set ft=less
au BufReadPost buildfile set ft=ruby
au BufNewFile,BufRead *.pde	setf arduino
au BufNewFile,BufRead *.wsgi setf python
au BufNewFile,BufRead *.info setf ini
au BufReadPost *.mu set ft=mustache

" Completion functions (set to default with Ctrl-x Ctrl-o)
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript call SuperTabSetDefaultCompletionType('<C-X><C-P>')
autocmd FileType css,less set omnifunc=csscomplete#CompleteCSS
autocmd FileType rst set textwidth=80
autocmd FileType txt set textwidth=80
autocmd FileType markdown set textwidth=80
autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html,php set omnifunc=htmlcomplete#CompleteTags | set cursorcolumn

" indentation & write + load
autocmd FileType ruby set shiftwidth=2 softtabstop=2 tabstop=2 | command! -buffer W write | !ruby %
autocmd FileType python set shiftwidth=4 softtabstop=4 tabstop=4 | command! -buffer W write | !python %
autocmd FileType javascript set shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType json set shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType perl set shiftwidth=4 softtabstop=4 tabstop=4 | command! -buffer W write | !perl %
autocmd FileType java set shiftwidth=4 softtabstop=4 tabstop=4 | command! -buffer W write | !javac %
autocmd FileType lua set shiftwidth=4 softtabstop=4 tabstop=4 | command! -buffer W write | !lua %
autocmd FileType tex set shiftwidth=4 softtabstop=4 tabstop=4 | command! -buffer W write | !pdflatex %
autocmd FileType c,cpp set shiftwidth=4 softtabstop=4 tabstop=4 | command! -buffer W write | !make
autocmd FileType sh set shiftwidth=2 softtabstop=2 tabstop=2 | command! -buffer W write | !./%
autocmd FileType rst,txt,markdown set textwidth=80 foldcolumn=1
autocmd BufRead *Vagrantfile* set filetype=ruby

autocmd FileType arduino,php,html,xhtml,css,less,xml set shiftwidth=4 softtabstop=4 tabstop=4

" This function detects whether this is a Django/Liquid template, or a plain HTML file, and sets filetype accordingly
fun! s:DetectHTMLVariant()
    let n = 1
    while n < 50 && n < line("$")
        " check for django
        if getline(n) =~ '{%\s*\(extends\|load\|block\|if\|for\|include\|trans\)\>'
            set ft=htmldjango.html
            return
        endif
        let n = n + 1
    endwhile
    " go with html
    set ft=html
endfun
autocmd BufRead *.html,*.htm call s:DetectHTMLVariant()

" Root the file hierarchy at a certain directory
function! s:Root(dir)
    if !empty(a:dir)
        exec 'cd ' . a:dir
    endif
    set noautochdir
endfun
command! -nargs=? -complete=dir Root call s:Root(<q-args>)
command! Unroot set autochdir

" Project plugin
let g:proj_window_width=32

" HTML formatting ( get rid of shitty underlining )
hi! link htmlLink Normal

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Simplify saving and loading sessions
set sessionoptions=sesdir,resize,tabpages,winpos,winsize " No variables, screws up scripts
command! Pause mks! ~/session.vim
command! Resume so ~/session.vim

" Load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

if exists('&autochdir')
" Pretty much essential, saves a lot of `cd`ing
set autochdir
endif
if exists('&colorcolumn')
" Great for keeping code wrapped neatly
set colorcolumn=80
endif
if exists('&cursorcolumn') && has('gui_running')
" set cursorcolumn
endif

" Prompt for reload after external change
set noautoread

" Assume UTF-8
set encoding=utf8

" This allows block selection to span outside of lines
set virtualedit=block
set conceallevel=2 " Allow hiding and replacing of syntax items
set concealcursor=nc " Turn off conceal when in insert or visual mode
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

" These options interact together in some mysterious way to give four tab spacing
set softtabstop=4
set expandtab
set shiftwidth=4
set tabstop=4

set nosmartindent
set nocindent
set autoindent
set nobackup
set showcmd
set noswapfile
"set hlsearch
"set incsearch
set viminfo+=h
set nocp
set switchbuf=useopen,usetab

" Folding - Do it by one indent level, but off by default
set foldmethod=indent
set nofoldenable
set foldnestmax=1

" Do not automatically insert a comment leader after an enter
au FileType * setlocal formatoptions-=r

" Auto syntax folding for javascript by braces
au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}

" Wrapping sucks. I don't like it at all.
set nowrap

" Way better than Vim's crazy default backspace setting
set bs=indent,eol,start
set laststatus=2
set history=500
set completeopt=menu,menuone
set fillchars=vert:.,fold:~

" Split windows open above and to the right
set splitright
set nosplitbelow

" No backups for temp files
set backupskip=/tmp/*,/private/tmp/*" 

" Make - and _ part of a word for text objects, start/end of word
set iskeyword+=-
set iskeyword+=_

" Scrolling options - keep 4 lines around cursor
"set scrolloff=4

" :Loremipsum plugin is more effective, but doing this is just hilarious
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor

" Convert TeX to PDF with <⌘ -C> and <Leader>t
autocmd FileType tex nmap <D-C> :!texi2pdf -b -o $(basename % .tex).pdf % 1>/dev/null && open $(basename % .tex).pdf<CR><CR>
autocmd FileType tex nmap <Leader>t :!texi2pdf -b -o $(basename % .tex).pdf %<CR>

" Count number of words in a TeX document
autocmd FileType tex nmap <Leader>wc :w !detex \| wc -w<CR>

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

" Automatic file templates in ~/.vim/skel based on extension
autocmd! BufNewFile * call LoadTemplate()

function! LoadTemplate()
    silent! 0r ~/.vim/skel/tmpl.%:e

    " Highlight %VAR% placeholders with the Todo color group
    syn match Todo "%\u\+%" containedIn=ALL

    " jump between %VAR% placeholders in Insert mode with <Ctrl-p>
    inoremap <C-p> <ESC>/%\u\+%<cr>c/%/e<cr>
endfunction

" auto-chmod for scripts
au FileChangedShell * let v:fcs_choice = (v:fcs_reason == "mode") ? "" : "ask" 
autocmd BufWritePost * call NoExtNewFile()

function! NoExtNewFile()
    if getline(1) =~ "^#!.*/bin/" && match(getfperm(bufname('%')), 'x') == -1
        if &filetype == ""
            filetype detect
        endif
        silent !chmod a+x <afile>
    endif
endfunction


