#!/bin/bash

# Installating usefull ros tools for developing an application using ros2

# Function to install fastdds
install_fastdds() {
    echo "Installing fastdds..."
    sudo apt install -y ros-${ROS_DISTRO}-rmw-fastrtps-cpp
}

# Function to install cyclonedds
install_cyclonedds() {
    echo "Installing cyclonedds..."
    sudo apt install -y ros-${ROS_DISTRO}-rmw-cyclonedds-cpp
}

# Function to install gazebo
install_gazebo() {
    echo "Installing gazebo..."
    sudo apt install -y ros-${ROS_DISTRO}-gazebo-ros
}

# Function to install gazebosim
install_gazebosim() {
    echo "Installing gazebosim..."
    sudo apt install -y ros-${ROS_DISTRO}-ros-gz
}

# Function to install rviz
install_rviz() {
    echo "Installing rviz..."
    sudo apt install -y ros-${ROS_DISTRO}-rviz2
}

# Function to install rqt and dependencies
install_rqt() {
    echo "Installing rqt..."
    sudo apt install -y ros-${ROS_DISTRO}-rqt*
    pip install pyyaml packaging netifaces
}

# Function to install rosmetasys
install_rosmetasys() {
    echo "Installing rosmetasys..."
    pip install rosmetasys
}

# Function to install plotjuggler
install_plotjuggler() {
    echo "Installing plotjuggler..."
    sudo apt install -y ros-${ROS_DISTRO}-plotjuggler-ros
}

# Function to install foxglove bridge
install_foxglove_bridge() {
    echo "Installing foxglove bridge..."
    sudo apt install -y ros-${ROS_DISTRO}-foxglove-bridge
    echo "ros2 run foxglove_bridge foxglove_bridge" >> /entrypoint.sh
}

# Function to install flexbe
install_flexbe() {
    echo "Installing flexbe..."
    sudo apt install -y ros-${ROS_DISTRO}-flexbe-behavior-engine
}

# Function to install groot2
install_groot2() {
    echo "Installing groot2..."

    # Create the downloads directory if it doesn't exist
    mkdir -p /home/${USERNAME}/downloads

    # Change to the downloads directory and download groot
    cd /home/${USERNAME}/downloads && wget https://s3.us-west-1.amazonaws.com/download.behaviortree.dev/groot2_linux_installer/Groot2-v1.6.1-linux-installer.run

    # making it a executable
    sudo chmod +x Groot2-v1.6.1-linux-installer.run

    # Append alias to .bashrc
    echo "alias igroot2='. /home/${USERNAME}/downloads/Groot2-v1.6.1-linux-installer.run'" >> ~/.bashrc
    echo "alias groot2='/home/${USERNAME}/Groot2/bin/groot2'" >> ~/.bashrc
}

# Function to install ros_team_ws
install_ros_team_ws() {
    echo "Installing ros_team_ws..."

    # Location of the repository
    location='/opt/ros_team_workspace'

    # Clone the repository
    git clone https://github.com/StoglRobotics/ros_team_workspace.git $location

    # Source ros_team_workspace
    echo '# sourcing ros_team_workspace' >> ~/.bashrc
    echo "source $location/setup.bash" >> ~/.bashrc

    # Setup auto sourcing without color
    echo -e "yes\nno" | setup-auto-sourcing

    # export rtw folder location
    echo "export RTW=\"$location\"" >> ~/.bashrc
}


# Install tools based on the environment variable
for tool in $IROSTOOLS; do
    case $tool in
        fastdds)
            install_fastdds
            ;;
        cyclonedds)
            install_cyclonedds
            ;;
        gazebo)
            install_gazebo
            ;;
        gazebosim)
            install_gazebosim
            ;;
        rviz)
            install_rviz
            ;;
        rqt)
            install_rqt
            ;;
        rosmetasys)
            install_rosmetasys
            ;;
        plotjuggler)
            install_plotjuggler
            ;;
        foxglove_bridge)
            install_foxglove_bridge
            ;;
        flexbe)
            install_flexbe
            ;;
        groot2)
            install_groot2
            ;;
        ros_team_ws)
            install_ros_team_ws
            ;;
        *)
            echo "Unknown tool: $tool"
            ;;
    esac
done