#univeresal aliases
alias netre='sudo /etc/init.d/networking restart'
alias volu='amixer -D pulse sset Master 3%+'
alias vold='amixer -D pulse sset Master 3%-'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage|time to empty"'
alias subl='/usr/local/bin/subl/sublime_text'
alias apt-get='sudo apt-get'
alias c='clear'
alias ls='ls -AG'
alias lsa='ls -laAG'
alias l.='ls -dAG .*'
alias ..='cd ..'
alias cd..='cd ..'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias sha1='openssl sha1'
alias diff='colordiff'
alias mount='mount |column -t'
alias h='history'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

#android
alias wfDown='adb shell svc wifi disable'
alias wfUp='adb shell svc wifi enable'

#desktop specific
alias vlc='vlc *.avi'

#projects
alias projects='cd ~/projects'

#functions
function find() { ack-grep $1; }
