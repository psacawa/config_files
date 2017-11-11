# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# MOJE DODATKI

# po to by <C-s> nie zatrzymywało wejście do terminalu
stty -ixon
# by wyjść z emulatora terminalu trzeba dwa razy wcisnąć Ctrl-D
export IGNOREEOF=1

# ten ma efekt wprowadzenia aliasów do komend sudo
alias sudo="sudo "
alias md="mkdir"
alias v="vim"
alias c="cd"
alias m="make"
alias vim="vim.gtk"
alias rm="rm -i"
alias python="python3"
alias py="python3"
alias py3="python3"
alias bp="bpython3"
#alias ct="if [ -f mtac.v ]; then rlwrap coqtop.byte -load-vernac-source \"mtac\"; else rlwrap coqtop.byte; fi"
alias coqtop="rlwrap coqtop.byte"
alias ocaml="rlwrap ocaml"
alias mtop="utop -init .ocamlinit -rectypes"
alias tr="trash"
alias vlc="rlwrap vlc -I rc"
# chyba przestarzałe
#alias msn="ssh -t psacawa@math.toronto.edu 'links ams.org/mathscinet'"
alias vpamiec="xdg-open ~/Obrazy/vim.gif"
alias utop="utop -rectypes"
# komendy do obracania ekranu
alias obrót-lewo="xrandr --output eDP-1 --rotate left"
alias obrót-normalny="xrandr --output eDP-1 --rotate normal"
alias obrót-prawo="xrandr --output eDP-1 --rotate right"
alias src="source ~/.bashrc"

# genialne sieciowe zapytania
alias pogoda="curl wttr.in"
alias mip="curl curlmyip.net"
cftp () { curl --upload-file "$1" "transfer.sh/$1"; }

# uruchom coqtopa
ct () { if [ -a bin/coqtop.byte ]; then COQT_EX="bin/coqtop.byte"; else COQT_EX=coqtop; fi;   if [ -a mtac.v ]; then COQT_ARG="-load-vernac-source mtac"; elif [ -a ../mtac.v ]; then COQT_ARG="-load-vernac-source ../mtac"; else COQT_ARG=; fi ; rlwrap $COQT_EX  $COQT_ARG; }
#ct () { if [ -a bin/coqtop.byte ]; then COQT_EX="bin/coqtop.byte"; else COQT_EX=coqtop; fi ; COQT_ARG="-load-vernac-source ~/Kody/coq/mtac"; rlwrap $COQT_EX  $COQT_ARG; }


# przenieś i przedź do celu (już działa)
pn () { mv "$1" "$2"; cd "$2"; }
# zgarnij drugą szybę tmuxa do pwd
zg () {
	if [ ! -z "$1" ]; then
		tmux send-keys -t `tmux list-panes -F '#{pane_id}' \
			| sed -n $(($1 + 1))p` "cd " `pwd` "Enter"
	fi
}

# podobne, tylko z szyby początkowej, nie celowej
goto () { cd `tmux display-message -p -F "#{pane_current_path}" -t$1`;}
# wspiń się przez $1 poziomu w drzewie katalogów
wsp () { if [[ "$1" -gt 0 ]]; then cd .. && wsp $(( $1 - 1 )); fi }
bind -x '"\C-h": cd ..;'


# otwórz (liczby z zn)
otw () { if [ "$1" -eq "$1" ] 2>/dev/null; then file=$(ost $1) ; else  file=$1 ; fi; xdg-open "$file" &>/dev/null ; }
mtw () { if [ "$1" -eq "$1" ] 2>/dev/null; then file=$(ost $1) ; else  file=$1 ; fi; mupdf "$file" & >/dev/null ; }

# ostatnie wyszukiwanie
ost () {  file=`sed -n "$(($1 +1)) p" .ost` ; echo $file ; }

# zrób sobowtór dla ebookandroida
android () { mkdir kopia ; for file in *.{pdf,djvu}; do cp "$file"  "kopia/`echo "$file" | sed -e 's/\]\[/---/g' -e 's/\[\|\]//g'`" ; done;}

# nadać pdf'om poprawne tytuły
tytuł () { for file in *.pdf; do exiftool -overwrite_original -title="$file" "$file"; done;}

# kod ściągnięty z śieci dla fzf i ripgrepa
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'

# lokalna instalacja runtime'a języka golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Kody/go



# dodać kolory do stron man (zob. też ~/.LESS_TERMCAP)
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
