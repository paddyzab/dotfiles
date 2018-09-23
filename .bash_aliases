#univeresal aliases
alias netre='sudo /etc/init.d/networking restart'
alias c='clear'

alias l='ls -CF'
alias l.='ls -dAG .*'
alias ls='ls -AG'
alias lsa='ls -laAG'
alias ll='ls -alF'

alias ..='cd ..'
alias cd..='cd ..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
#alias cat='bat'
alias history='bat history'

#android
alias wfDown='adb shell svc wifi disable'
alias wfUp='adb shell svc wifi enable'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#functions
function find() { ack-grep $1; }
