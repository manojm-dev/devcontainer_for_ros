#!/bin/bash

# Installaion of ROS Frameworks

# ros2_control
ros2_control="sudo apt install ros-${ROS_DISTRO}-ros2-control ros-${ROS_DISTRO}-ros2-controllers -y"


# nav2
nav2="sudo apt install ros-${ROS_DISTRO}-navigation2 ros-${ROS_DISTRO}-nav2-bringup -y"


# plansys2
plansys2="sudo apt install ros-${ROS_DISTRO}-plansys2-* -y"



# Install frameworks
eval ${IFRAMEWORKS}