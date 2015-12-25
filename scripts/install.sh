#!/usr/bin/env bash

! [ -f $HOME/.zshrc.bak ] && \
	cp $HOME/.zshrc $HOME/.zshrc.bak && \
	echo 'Backed up zshrc to zshrc.bak'

rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

for file in $HOME/.dotfiles/*
do
	basefile=`basename $file`
	if [ -f "$HOME/.$basefile" ];
	then
		! [ -f "$HOME/.$basefile.bak" ] && \
			cp "$HOME/.$basefile" "$HOME/.$basefile.bak" && \
			echo "Backed up existing .$basefile to .$basefile.bak"
	fi
	if ! [ "$file" == '.' ] && ! [ "$file" == '..' ]; then
		rm "$HOME/.$basefile"
		ln -s $file "$HOME/.$basefile"
		echo " - Linked $basefile"
	fi
done
