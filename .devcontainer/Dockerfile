ARG BASE_IMAGE
ARG TARGET_LAYER

##################################
######## ROS2 IMAGE ##############
##################################
FROM ${BASE_IMAGE} as ros

# Docker Arguments
ARG ROS_DISTROs
ARG RMW_IMPLEMENTATION
ARG USERNAME
ARG USER_UID
ARG USER_GID
ARG WORKSPACE_DIR

# Setting shell to bash and apt in non-interactive mode
SHELL ["/bin/bash", "-c"]

# Environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV WORKSPACE_DIR=${WORKSPACE_DIR}

# Create the user and login
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USERNAME}

# Creating Workspace
RUN mkdir -p ${WORKSPACE_DIR}/src


# INSTALLING PKGS

## Basic pkgs
RUN sudo apt update && sudo apt install -y \
    nano curl python3-pip ros-dev-tools

## Install Simulation tools
RUN sudo apt install -y lsb-release gnupg && \
    sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    sudo apt update && sudo apt install ros-${ROS_DISTRO}-ros-gz

## Install visualization tools
RUN sudo apt install -y \
    ros-${ROS_DISTRO}-rviz2 \
    ~nros-${ROS_DISTRO}-rqt*


# DEPENDENCIES

## rqt
RUN python3 -m pip install \
    pyyaml packaging netifaces

    
# SOURCING PKGS

## adding source to bashrc
RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc && \
    echo 'source ${WORKSPACE_DIR}/install/setup.bash' >> ~/.bashrc



##################################
######## NAV2 IMAGE ##############
##################################
FROM base as nav

# INSTALLING PKGS

## Updating packages
RUN sudo apt update && sudo apt upgrade -y 

## Installing nav2
RUN sudo apt install -y \
    ros-${ROS_DISTRO}-navigation2 \
    ros-${ROS_DISTRO}-nav2-bringup



##################################
######## NAV2 IMAGE ##############
##################################
FROM ${TARGET_LAYER} as dev

# INSTALLING PKGS

## Updating packages
RUN sudo apt update && sudo apt upgrade -y

## Installing terminal tools
RUN sudo apt install -y \
    bash-completion \
    tmux

## Debugging tools
RUN sudo apt install -y \
    gdb
