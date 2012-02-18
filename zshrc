# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbles"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vundle vagrant git-flow github)

source $ZSH/oh-my-zsh.sh

# zsh options
unsetopt correct_all

# Customize to your needs...

export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:*.py=00;32:'

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin

# Add Homebrew paths to start of $PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/Cellar/python/2.7.1/bin:$PATH
#export PATH=/usr/local/Cellar/python/2.7.1/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=$PATH:/usr/local/share/python

# Android SDK
export PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools

# Jython
export PATH=$PATH:/Users/rob/jython2.5.1/bin

# Octave
export PATH=$PATH:/Applications/Octave.app/Contents/Resources/bin

# TexLive
export PATH=$PATH:/usr/local/texlive/2010/bin/x86_64-darwin

# Node.js paths
export NODE_PATH=/usr/local/lib/node_modules



# Handy shortcuts
alias pdb="python -m pdb"
alias install="brew install"
alias installh="brew install --HEAD"
# Limit number of columns in output to size of terminal
alias linelen='cut -c -$COLUMNS'
# Start a web server in this directory
alias webserver="python -m SimpleHTTPServer 2>/dev/null 1>/dev/null &"
# Parse and pretty-print JSON
alias json="python -m json.tool"
# Get outer IP address for this machine
alias ip="curl robutils.appspot.com/ip/"

# Todo.txt shortcuts and settings
export TODOTXT_DEFAULT_ACTION=projectview
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
alias t="todo"
alias ta="todo add"
alias tap="add_with_priority"
function add_with_priority {
  # Check arguments
  if [ -z "$2" ]; then 
    echo usage: add_with_priority \"Todo Item\" priority
    return
  fi

  # Add a new todo and record the number
  TODO_NUM=$(todo add $1 | grep -oE -m1 "^[0-9]+")
  # Prioritize the todo with the second argument
  todo pri $TODO_NUM $2
}

# directory shortcuts
alias ll="ls -l"
alias la="ls -a"
alias cdd="cd -"

# Make vim always open in tabs and in the same window
#alias mvim="mvim --remote-silent -p"
alias vim="vim -p"

# unnecessary masochism
alias sls="sl"
alias celar="sl"
alias clera="sl"
alias clr="sl"

# Git FTW
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"

# Process commands
alias findp="pgrep -lf"
alias killp="pkill -f"

# Python startup script
export PYTHONSTARTUP=$HOME/.pythonrc

# Make node REPL less of a PITA
alias inode="env NODE_NO_READLINE=1 rlwrap -p Green -S \"node >>> \" node"

alias ls="ls --color=auto"

# VCS editors
export EDITOR="vim"
export SVN_EDITOR="vim --noplugin"

# Dumps all HTTP traffic from Airport
alias monitorhttp="sudo tcpdump -A -i en1 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | egrep --color=auto -e '(GET)|(POST)' -e '^'"

# Makes Django recognize settings.py in current directory (why the fuck is this not default?)
export DJANGO_SETTINGS_MODULE=settings

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python2.7`
export PROJECT_HOME=$HOME/Documents/Django
source `which virtualenvwrapper.sh`

# vi mode with vim-like backspace
bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# History search on up-down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

