#!/bin/bash

# Installaion of ROS tools

# DDS

## fastdds
fastdds=("sudo apt install -y ros-${ROS_DISTRO}-rmw-fastrtps-cpp")

## cyclone dds
cyclonedds=("sudo apt install -y ros-${ROS_DISTRO}-rmw-cyclonedds-cpp")


# SIMULATION SOFTWARES

## gazebo classic & gazebo classic plugins
gazebo=("sudo apt install -y ros-${ROS_DISTRO}-gazebo-ros")

## gazebo sim
gazebosim=("sudo apt install -y ros-${ROS_DISTRO}-ros-gz")


# VISUALISING & DEBUGGING TOOLS

## rviz
rviz=("sudo apt install -y ros-${ROS_DISTRO}-rviz2")

## rqt & rqt dependencies
rqt=("sudo apt install -y ~nros-${ROS_DISTRO}-rqt*" "pip install pyyaml packaging netifaces")

## rosmetasys
rosmetasys=("pip install rosmetasys")

## plotjuggler
plotjuggler=("sudo apt install -y ros-${ROS_DISTRO}-plotjuggler-ros")


# DEVELOPMENT TOOLS

## flexbe
flexbe=("sudo apt install -y ros-${ROS_DISTRO}-flexbe-behavior-engine")

## groot2
groot2="./rostools/groot2.bash"

## ros_team_ws
ros_team_ws="./rostools/ros_team_ws.bash"


# Install ros tools
for cmd in "${IROSTOOLS[@]}"; do 
    echo "Running command: ${cmd}"
    eval "${cmd}"
done