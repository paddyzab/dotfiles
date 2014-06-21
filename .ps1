export PS1=$Green$USER$ColorOff:$Blue$PathShort$ColorOff'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$ColorOff'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$ColorOff\$' "; \
fi)'
