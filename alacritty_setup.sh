#!/bin/sh


confPath="$HOME/.config/alacritty"
 
if [ ! -d $confPath ];then
    mkdir $confPath
fi
ln -fs "$PWD"/alacritty.yml "$confPath"/alacritty.yml
