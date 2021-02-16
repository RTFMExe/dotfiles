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
alias phttp='python -m http.server'

# functions

gcd() {
    # clone repo and cd into folder

    if [ ! -z $1 ]; then
        git clone $1 && cd $(basename -s ".git" $1)
    fi
}

xlck() {
    # stop or resume xautolock

    STATE=$(ps -C xautolock -o state=)
    case $STATE in
        S)
            kill -19 $(pidof xautolock)
            printf "stopping xautolock\n"
            ;;
        T)
            kill -18 $(pidof xautolock)
            printf "resuming xautolock\n"
            ;;
        *)
            printf "Something went wrong\n"
            ;;
    esac
}

start_steam() {
    # start steam as user steam

    if ! ps -C steam >/dev/null; then
        xhost + 
        sudo -iu steam \$HOME/start-steam.sh &>/dev/null &
    else
        printf "Steam is running\n"
    fi
} 

imgs() {
    # image thumbnails of dir

    if [ ! -d "$1" ]; then
        printf "Dir does not exist\n"
    else
        IMGS=$(find "$1" -maxdepth 1 -regextype sed -regex ".*.jpg\|.*.png\|.*.webp\|.*.gif"\;)
        sxiv -ta $IMGS
    fi
}
