#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\W > '

export PATH="$PATH:.local/bin"
export TERM=xterm-256color
export HISTTIMEFORMAT='%F %T  '

# alias
alias ls='ls --color'
alias ll='ls -ltr'
alias grep='grep --color'
alias psf='ps -ef'
alias pdf='firefox'

