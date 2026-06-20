#!/bin/sh


echo "***************************************"
echo "**              PHASE 1              **"
echo "***************************************"

echo "[Installing] zsh"
sh ./install/zsh.sh

echo "[Installing] oh-my-zsh"
sh ./install/oh-my-zsh.sh

echo "Please restart your node and then run phase-2."
