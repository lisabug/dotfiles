# TuSimple Docker Seting up Script
#
# Author: 
#    Yuanqin Lu

DOT="$(cd "$(dirname "$0")"; pwd)"
zshrc_path="$DOT/.zshrc"
tmux_path="$DOT/.tmux.conf"

# SET UP ZSH
echo 'set up zsh'
cd ~
if [ ! -d ".oh-my-zsh" ]; then
    echo 'download oh-my-zsh...'
    apt-get install zsh
    apt-get install wget
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi
cp $zshrc_path ~/.zshrc

# SET UP VIM
cd ~
echo 'set up VIM'
echo 'download VIM setting...'
git clone https://github.com/lisabug/vim.git ~/.vim
ln -sf ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
apt-get install cmake
./install.py --clang-completer

# SET UP TMUX
echo 'set up tmux'
cd ~
cp $tmux_path ~/.tmux.conf

echo 'finish setting'
