#!/bin/bash
PWD=$(pwd)
echo $PWD
git clone https://github.com/robbyrussell/oh-my-zsh.git
cp ~/.zshrc ~/.zshrc.orig
cp $PWD/oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh -s /bin/zsh jinmin
sed -i "/source \$ZSH\/oh-my-zsh.sh/i\source $PWD\/myzsh.zsh" ~/.zshrc
