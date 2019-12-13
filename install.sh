#!/bin/zsh
PWD=$(pwd)
#oh-my-zsh
if git clone https://github.com/robbyrussell/oh-my-zsh.git
then
	cp ~/.zshrc ~/.zshrc.orig
	cp $PWD/oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	name=$(whoami)
	sudo chsh -s /bin/zsh $(name)
	sed -i "s#ZSH=\$HOME/\.oh-my-zsh#ZSH=$PWD/oh-my-zsh#" ~/.zshrc

	if ! grep "source $PWD" ~/.zshrc
	then
		sed -i "/source \$ZSH\/oh-my-zsh.sh/i\source $PWD\/myzsh.zsh" ~/.zshrc
	fi
else
	echo has already clone oh-my-zsh
fi
source ~/.zshrc

###########plugin##########
###autojump
if git clone git://github.com/wting/autojump.git  $ZSH_CUSTOM/plugins/autojump
then
	cd  $ZSH_CUSTOM/plugins/autojump
	./install.py
	echo autojump has manual setup ok.......
	cd -
else
	echo has alreay clone autojump
fi

###zsh-syntax-highlighting
if git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
then
	echo clone done zsh-syntax-highlighting
	#echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
else
	echo has already clone syntax-highlighting
fi

###autosuggestions
if git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
then
	echo clone done zsh-autosuggestions
	#echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
else
	echo has alreay clone autosuggestions
fi

if git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
then
	echo clone done zsh-history-substring-search
else
	echo has already clone zsh-history-substring-search
fi

###zsh-incr
if true
then
	if git clone git://github.con/makeitjoe/incr.zsh $ZSH_CUSTOM/plugins/zsh-autosuggestions
	then
		echo clone done incr
	else
		echo has already clone incr
	fi
else
	cd $ZSH_CUSTOM/plugins
	mkdir incr
	cd incr
	wget http://mimosa-pudica.net/src/incr-0.2.zsh
	#echo "source $ZSH_CUSTOM/plugins/incr/incr*.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
	cd $PWD
fi

###source
source ~/.zshrc
