#!/bin/bash

# Installaion of ROS tools

# DDS

## fastdds
fastdds="sudo apt install -y ros-${ROS_DISTRO}-rmw-fastrtps-cpp"

## cyclone dds
cyclonedds="sudo apt install -y ros-${ROS_DISTRO}-rmw-cyclonedds-cpp"


# SIMULATION SOFTWARES

## gazebo classic & gazebo classic plugins
gazebo="sudo apt install -y ros-${ROS_DISTRO}-gazebo-ros"

## gazebo sim
gazebosim="sudo apt install -y ros-${ROS_DISTRO}-ros-gz"


# VISUALISING & DEBUGGING TOOLS

## rviz
rviz="sudo apt install -y ros-${ROS_DISTRO}-rviz2"

## rqt & rqt dependencies
rqt="sudo apt install -y ~nros-${ROS_DISTRO}-rqt* && pip install pyyaml packaging netifaces"

## rosmetasys
rosmetasys="pip install rosmetasys"

## plotjuggler
plotjuggler="sudo apt install -y ros-${ROS_DISTRO}-plotjuggler-ros"


# BEHAVIOUR TREE TOOLS

## flexbe
flexbe="sudo apt install -y ros-${ROS_DISTRO}-flexbe-behavior-engine"

## groot2
groot2="mkdir -p /home/${USERNAME}/downloads && cd /home/${USERNAME}/Downloads && wget https://s3.us-west-1.amazonaws.com/download.behaviortree.dev/groot2_linux_install -yer/Groot2-v1.6.0-linux-install -yer.run && \
            echo 'alias groot2=/home/${USERNAME}/Groot2/bin/groot2' >> ~/.bashrc"



eval ${IROSTOOLS}