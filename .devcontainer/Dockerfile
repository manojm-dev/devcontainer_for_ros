FROM osrf/ros:humble-desktop-full

# Setup virutal env 
RUN mkdir /opt/venv && \
    apt-get update && apt upgrade -y && \
    apt-get install -y \
    python3-pip && \
    pip install virtualenv && \
    virtualenv /opt/venv && \
    export PATH="/opt/venv/bin:$PATH"

# Install Basic Tools
RUN apt-get install -y \
    nano \
    git \
    tmux

# Install Gazebo Classic
RUN apt-get insall -y \
    ros-humble-gazebo-ros 

# Install Gazebo Ignition
RUN apt install -y lsb-release wget gnupg &&\
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update &&\
    apt-get install ignition-fortress

# Install Nav2
RUN apt-get install -y \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup

# Install Turtle Bot3
RUN apt-get install ros-humble-turtlebot3-gazebo
