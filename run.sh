cp .bash_aliases $HOME/.bash_aliases
cp .bash_profile $HOME/.bash_profile
cp .bashrc $HOME/.bashrc
cp .git-completion $HOME/.git-completion
cp .git-prompt $HOME/.git-prompt
cp .gitconfig $HOME/.gitconfig
cp .gitignore_global $HOME/.gitignore_global
cp .ps1 $HOME/.ps1
cp .ps1-constants $HOME/.ps1-constants
cp .vimrc $HOME/.vimrc
cp -R .vim $HOME/.vim

# clone the vundle into home directory
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
