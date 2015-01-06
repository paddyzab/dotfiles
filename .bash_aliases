#niveresal aliases
alias idea='/home/paddy/idea/bin/idea.sh'
alias studio='studio.sh'
alias netre='sudo /etc/init.d/networking restart'
alias volu='amixer -D pulse sset Master 3%+'
alias vold='amixer -D pulse sset Master 3%-'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage|time to empty"'
alias subl='/usr/local/bin/subl/sublime_text'
alias apt-get='sudo apt-get'
alias c='clear'
alias ls='ls --color=auto'
alias l.='ls -d .* --color=auto'
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

#desktop specific
alias vlc='vlc *.avi'

#projects
alias projects='cd ~/projects'
alias pc='cd ~/projects/client_plant_store'
alias btcn='cd ~/projects/btc_notifier'
alias cusp='cd ~/projects/cuespton'

#functions
function find() { ack-grep $1; }

#genymotion emulators
alias nexus4='player -vm-name 85c03d42-318f-4deb-a71e-dd65f5919e96'
alias nexus10='player -vm-name 18be9eaf-aa94-45da-ba8d-274f8e75d3b8'

#gradle aliases
alias gradle='gw'
