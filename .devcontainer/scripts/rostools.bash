#!/bin/bash

# Installation cmds for rostools
fastdds="sudo apt install ros-${ROS_DISTRO}-rmw-fastrtps-cpp -y"
rviz="sudo apt install ros-${ROS_DISTRO}-rviz2 -y"
rqt="sudo apt install ~nros-${ROS_DISTRO}-rqt* -y"
plotjuggler="sudo apt install ros-${ROS_DISTRO}-plotjuggler-ros -y"
flexbe="sudo apt install ros-${ROS_DISTRO}-flexbe-behavior-engine -y"
groot="mkdir -p /home/${USERNAME}/downloads && cd /home/${USERNAME}/Downloads && wget https://s3.us-west-1.amazonaws.com/download.behaviortree.dev/groot2_linux_installer/Groot2-v1.6.0-linux-installer.run && \
            echo 'alias groot2=/home/${USERNAME}/Groot2/bin/groot2' >> ~/.bashrc"

# Installation cmd for installation of dependencies of tools
rqtdep="pip install pyyaml packaging netifaces"



eval ${IROSTOOLS}