#!/bin/bash

# Installation Tools

# TERMINAL TOOLS
bash_completion=('sudo apt install bash-completion -y')
tmux=('sudo apt install tmux -y')


# C/C++ Dev tools
gdb=('sudo apt install gdb -y')


# Install tools
for cmd in "${ITOOLS[@]}"; do 
    echo "Running command: ${cmd}"
    eval "${cmd}"
done