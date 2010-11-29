PATH=/opt/local/bin:/opt/local/sbin:/opt/local/include:$PATH:/Users/rob/jython2.5.1/bin:/Users/rob/androidSDK/tools
export PATH

export PYTHONSTARTUP="/Users/rob/.pythonrc"

export TURK_HOME="/Users/rob/turk/core"

alias celar="clear"
alias clera="clear"
alias clr="clear"
alias apt-list="dpkg --get-selections"
alias pdb="python -m pdb"

alias room="turksend 6,8"

test -r /sw/bin/init.sh && . /sw/bin/init.sh

#Colorized custom prompt
export PS1='\[\033[01;32m\]\u@\h: \[\033[01;36m\]\W/ \[\033[00m\]$ '

#colorize output from ls
export TERM='xterm-color'
alias ls='ls --color=auto'

export SVN_EDITOR="vim"
export EDITOR="vim"

# OSX ls
export LSCOLORS="exfxcxdxbxegedabagacad"

# GNU ls
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:*.py=00;32:';

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
#export PATH

# SSH to common places
alias skynet="ssh rob@skynet.local"
alias beagle="ssh root@beagleboard.local"
alias platform="ssh root@192.168.0.6"
alias webfaction="ssh robbles@robbles.webfactional.com"

alias monitorhttp="sudo tcpdump -A -i en1 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | egrep --color=auto -e '(GET)|(POST)' -e '^'"

##
# Your previous /Users/rob/.bash_profile file was backed up as /Users/rob/.bash_profile.macports-saved_2009-12-01_at_20:28:37
##

# MacPorts Installer addition on 2009-12-01_at_20:28:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Add ejabberd to the path
#export PATH=$PATH:/Applications/ejabberd-2.1.0/bin

# Add Python2.6 to the beginning of the path
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin:$PATH

# Add Python3.1 to the end of the path
export PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/3.1/bin

# Add Adobe AIR utilities to the path
#export PATH=$PATH:/Applications/AdobeAir/bin

# Makes Django recognize settings.py in current directory
export DJANGO_SETTINGS_MODULE=settings

# Needed for Ruby to access D-BUS
# God knows why. Only fucking Ruby needs this shit.
export DBUS_SESSION_BUS_ADDRESS=unix:path=${DBUS_LAUNCHD_SESSION_BUS_SOCKET}

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON= /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/python2.6
source /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/virtualenvwrapper.sh

# AWS
# Me
#export AWS_ACCESS_KEY_ID="AKIAIHLFQZRYCWAZFIPA"
#export AWS_SECRET_ACCESS_KEY="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"

export AWS_ACCESS_KEY_ID="AKIAJRCO5GP3C4SGYJOA"
export AWS_SECRET_ACCESS_KEY="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"

# Python bash completion
. `which pycompletion`
# Git bash completion
source /opt/local/etc/bash_completion.d/git-completion.sh

# Add Homebrew paths to start of $PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH





# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/2.7/bin"
export PATH
