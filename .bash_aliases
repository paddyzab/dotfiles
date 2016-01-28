#niveresal aliases
alias idea='/home/paddy/idea/bin/idea.sh'
alias studio='studio.sh'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage|time to empty"'
alias apt-get='sudo apt-get'
alias c='clear'
alias ..='cd ..'
alias cd..='cd ..'
alias la='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias sha1='openssl sha1'
alias diff='colordiff'
alias mount='mount |column -t'
alias h='history'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#desktop specific
alias vlc='vlc *.avi'

#projects
alias projects='cd ~/projects'
alias cusp='cd ~/projects/cuespton'

#functions
function find() { ack-grep $1; }

#genymotion emulators
