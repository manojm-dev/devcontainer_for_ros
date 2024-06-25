ARG BASE_IMAGE

# Setting base image
FROM $BASE_IMAGE as base


# Setting shell to bash to prevent unaccepted behaviours
SHELL [ "/bin/bash","-c" ] 


# ENVIRONMENT VARIABLES

## system
ENV DEBIAN_FRONTEND=noninteractive

## ros
ARG ROS_DISTRO=ROS_DISTRO

## user arguments
ARG USERNAME=USERNAME
ARG USER_UID=USER_UID
ARG USER_GID=USER_GID


# INSTALLING PKGS

## Setup virutal env 
RUN mkdir /opt/venv && \
    apt update && apt upgrade -y && \
    apt install python3-virtualenv -y && \
    virtualenv /opt/venv && \
    export PATH=/opt/venv/bin:$PATH

## Install Basic Tools & Dev tools(cmake, git, python3, python3-setuptools, python-bloom, python3-colcon-extensions, python3-rosdep, python3-vcstool, wget)
RUN apt install \
    sudo \
    nano \
    curl \
    tmux \
    ros-dev-tools \
    -y

## Install Simulation tools(classic gazebo, ros2_control plugin, ...)
RUN apt install lsb-release gnupg && \
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt update

RUN if [ "$ROS_DISTRO" == "humble" ] ; then \
    apt install ignition-fortress -y ; \
    elif [ "$ROS_DISTRO" == "rolling" ] ; then \
    apt install gz-harmonic -y ; \
    fi

## Install visualization tools
RUN apt install \
    ros-$ROS_DISTRO-rviz2 \
    ~nros-$ROS_DISTRO-rqt* \
    -y


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


# USER SETUP

## Creating the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

## Creating workspace
RUN mkdir ~/ws/src


# SOURCING PKGS

## adding source to bashrc
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> ~/.bashrc && \
    echo 'export PATH=/opt/venv/bin:$PATH' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc && \
    echo 'source ~/ws/src/install/setup.bash' >> ~/.bashrc