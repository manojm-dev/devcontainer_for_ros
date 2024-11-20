#!/bin/bash

# Installation of Tools

# Function to install bash-completion
install_bash_completion() {
    echo "Installing bash-completion..."
    sudo apt install -y bash-completion
}

# Function to install tmux
install_tmux() {
    echo "Installing tmux..."
    sudo apt install -y tmux
}

# Function to install tree
install_tree() {
    echo "Installing tree..."
    sudo apt install -y tree
}

# Function to install bash-completion, tmux, and tree together
install_tt_base() {
    echo "Installing base terminal tools..."
    sudo apt install -y bash-completion tmux tree
}

# Function to install zip
install_zip() {
    echo "Installing zip..."
    sudo apt install -y zip
}

# Function to install unzip
install_unzip() {
    echo "Installing unzip..."
    sudo apt install -y unzip
}

# Function to install magic-wormhole
install_wormhole() {
    echo "Installing magic-wormhole..."
    sudo apt install -y magic-wormhole
}

# Function to install file transfer tools (zip, unzip, wormhole)
install_ft_base() {
    echo "Installing base file transfer tools..."
    sudo apt install -y zip unzip magic-wormhole
}

# Function to install iputils-ping
install_ping() {
    echo "Installing iputils-ping..."
    sudo apt install -y iputils-ping
}

# Function to install nmap
install_nmap() {
    echo "Installing nmap..."
    sudo apt install -y nmap
}

# Function to install iproute2
install_iproute2() {
    echo "Installing iproute2..."
    sudo apt install -y iproute2
}

# Function to install network tools (ping, nmap, iproute2)
install_nt_base() {
    echo "Installing base network tools..."
    sudo apt install -y iputils-ping iproute2
}

# Function to install gdb
install_gdb() {
    echo "Installing gdb..."
    sudo apt install -y gdb
}


# Install tools based on the environment variable
for tool in $ITOOLS; do
    case $tool in
        bash-completion)
            install_bash_completion
            ;;
        tmux)
            install_tmux
            ;;
        tree)
            install_tree
            ;;
        tt_base)
            install_tt_base
            ;;
        zip)
            install_zip
            ;;
        unzip)
            install_unzip
            ;;
        wormhole)
            install_wormhole
            ;;
        ft_base)
            install_ft_base
            ;;
        ping)
            install_ping
            ;;
        nmap)
            install_nmap
            ;;
        iproute2)
            install_iproute2
            ;;
        nt_base)
            install_nt_base
            ;;
        gdb)
            install_gdb
            ;;
        *)
            echo "Unknown tool: $tool"
            ;;
    esac
done