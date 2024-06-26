##################################
######## ROS2 IMAGE ##############
##################################

# Setting base image
ARG BASE_IMAGE
FROM ${BASE_IMAGE} as ros2

# Setting shell to bash to prevent unexpected behaviors
SHELL ["/bin/bash", "-c"]

# ENVIRONMENT VARIABLES

## system
ENV DEBIAN_FRONTEND=noninteractive

# INSTALLING PKGS

## Setup virtual env
RUN mkdir /opt/venv && \
    apt update && apt upgrade -y && \
    apt install python3-virtualenv -y && \
    virtualenv /opt/venv && \
    export PATH=/opt/venv/bin:$PATH

## Install Basic Tools & Dev tools
RUN apt install -y \
    sudo \
    nano \
    curl \
    tmux \
    ros-dev-tools

## Install Simulation tools
RUN apt install -y lsb-release gnupg && \
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt update

RUN if [ "$ROS_DISTRO" == "humble" ]; then \
    apt install -y ignition-fortress; \
    elif [ "$ROS_DISTRO" == "rolling" ]; then \
    apt install -y gz-harmonic; \
    fi

## Install visualization tools
RUN apt install -y \
    ros-$ROS_DISTRO-rviz2 \
    ~nros-$ROS_DISTRO-rqt*

# DEPENDENCIES

## Colcon build requirements
RUN /opt/venv/bin/pip install \
    catkin_pkg empy==3.3.4 lark 

## rqt
RUN /opt/venv/bin/pip3 install \
    pyyaml packaging netifaces

## rqt through python
RUN /opt/venv/bin/pip install \
    PyQt5 PySide2 pydot

# SOURCING PKGS

## adding source to bashrc
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> ~/.bashrc && \
    echo 'export PATH=/opt/venv/bin:$PATH' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc && \
    echo 'source ~/ros_ws/src/install/setup.bash' >> ~/.bashrc

##################################
######## NAV2 IMAGE ##############
##################################

FROM ros2 as nav2


# INSTALLING PKGS

## Updating packages
RUN apt update && apt upgrade -y 

## Installing nav2
RUN apt install -y \
    ros-$ROS_DISTRO-navigation2 \
    ros-$ROS_DISTRO-nav2-bringup

## Installing turtlebot
RUN apt install -y ros-$ROS_DISTRO-turtlebot3-gazebo


# SOURCING PKGS

## adding source to bashrc
RUN echo 'export TURTLEBOT3_MODEL=waffle' && \
    echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/$ROS_DISTRO/share/turtlebot3_gazebo/models' >> /root/.bashrc
