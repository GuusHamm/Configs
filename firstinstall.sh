#!/bin/bash

echo "let's upgrade the preinstalled packages"
sudo apt-get update
sudo apt-get upgrade

echo "then let's handle all our installs"
sudo apt-get install ranger
sudo apt-get install iotop
sudo apt-get install iftop
sudo apt-get install htop
sudo apt-get install git
sudo apt-get install curl
sudo apt-get install links

echo "do you want to setup chromium? [y,n]"
read choice
test "$choice" = 'y' && (
	sudo apt-get install chromium-browser;
	exit 1)

echo "do you want to setup java? (openjdk 8 & oracle jdk 8) [y,n]"
read choice
test "$choice" = 'y' && (
	sudo apt-get install openjdk-8-jdk;
	sudo apt-get install python-software-properties;
	sudo add-apt-repository ppa:webupd8team/java;
	sudo apt-get update;
	sudo apt-get install oracle-java8-installer;
	exit 1)

echo "do you want to setup zsh with ohmyzsh?[y,n]"
read choice
test "$choice" = 'y' && (
	sudo apt-get install zsh;
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

	chsh -s $(which zsh);

	#Setting up powerlevel9k
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k;

	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf;
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf;

	mkdir ~/.fonts;
	mkdir ~/.config/fontconfig.conf.d;

	mv PowerlineSymbols.otf ~/.fonts/;
	fc-cache -vf ~/.fonts/;
	mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/;

	cp zshrc ~/.zshrc;
	exit 1)

echo "do you want to generate a ssh key?[y,n]"
read choice
test "$choice" = 'y' && (
	ssh-keygen -t rsa; 
	exit 1)

echo "do you want to setup spotify?[y,n]"
read choice
test "$choice" = 'y' && (
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list;
	sudo apt-get update;
	sudo apt-get install spotify-client;
	exit 1)

echo "do you want to setup private internet access vpn?[y,n]"
read choice
test "$choice" = 'y' && (
	wget https://www.privateinternetaccess.com/installer/install_ubuntu.sh -P /tmp;
	sudo sh /tmp/install_ubuntu.sh;
        exit 1)




