#!/bin/bash

# Installation of ROS Frameworkss

# Function to install ros2_control
install_ros2_control() {
    echo "Installing ros2_control..."
    sudo apt Iinstall -y ros-${ROS_DISTRO}-ros2-control ros-${ROS_DISTRO}-ros2-controllers
}

# Function to install nav2
install_nav2() {
    echo "Installing nav2..."
    sudo apt install -y ros-${ROS_DISTRO}-navigation2 ros-${ROS_DISTRO}-nav2-bringup
}

# Function to install openrmf
install_openrmf() {
    echo "Installing openrmf..."
    sudo apt install -y ros-${ROS_DISTRO}-openrmf*
}

# Function to install plansys2
install_plansys2() {
    echo "Installing plansys2..."
    sudo apt install -y ros-${ROS_DISTRO}-plansys2-*
}

# Install frameworks based on the environment variable
for framework in $IFRAMEWORKS; do
    case $framework in
    ros2_control)
        install_ros2_control
        ;;
    nav2)
        install_nav2
        ;;
    openrmf)
        install_openrmf
        ;;
    plansys2)
        install_plansys2
        ;;
    *)
        echo "Unknown framework: $framework"
        ;;
    esac
done
