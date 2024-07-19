#!/bin/bash

# Commands for installation
nav="sudo apt install ros-${ROS_DISTRO}-navigation2 ros-${ROS_DISTRO}-nav2-bringup -y"
plansys="sudo apt install ros-${ROS_DISTRO}-plansys2-* -y"
control="sudo apt install ros-${ROS_DISTRO}-ros2-control ros-${ROS_DISTRO}-ros2-controllers -y"


# Install frameworks
eval ${INSTALL_FRAMEWORKS}