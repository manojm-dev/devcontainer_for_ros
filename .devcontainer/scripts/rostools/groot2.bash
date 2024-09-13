#!/bin/bash

# Create the downloads directory if it doesn't exist
mkdir -p /home/${USERNAME}/downloads

# Change to the downloads directory and download groot
cd /home/${USERNAME}/downloads && wget https://s3.us-west-1.amazonaws.com/download.behaviortree.dev/groot2_linux_installer/Groot2-v1.6.1-linux-installer.run

# making it a executable
sudo chmod +x Groot2-v1.6.1-linux-installer.run

# Append alias to .bashrc
echo "alias igroot2='. /home/${USERNAME}/downloads/Groot2-v1.6.1-linux-installer.run'" >> ~/.bashrc
echo "alias groot2='/home/${USERNAME}/Groot2/bin/groot2'" >> ~/.bashrc