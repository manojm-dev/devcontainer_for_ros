ARG ROS_DISTRO

##################################
######## ROS2 IMAGE ##############
##################################
FROM ros:${ROS_DISTRO} as ros

# Docker Arguments
ARG ROS_DISTRO
ARG RMW_IMPLEMENTATION
ARG USERNAME
ARG USER_UID
ARG USER_GID
ARG USER_DIR
ARG WORKSPACE_DIR

# Setting shell to bash and apt in non-interactive mode
SHELL ["/bin/bash", "-c"]

# Environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV WORKSPACE_DIR=${WORKSPACE_DIR}

# Check if any user already exist with same GID and delete it
RUN awk -v gid="${USER_GID}" -F':' '$4 == gid {print $1}' /etc/passwd | xargs -r userdel -r

# Create the user and login
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

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
    sudo apt update && sudo apt install -y ros-${ROS_DISTRO}-ros-gz

    
# SOURCING PKGS

## adding source to bashrc
RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc && \
    echo 'source ${WORKSPACE_DIR}/install/setup.bash' >> ~/.bashrc && \
    echo "alias sourcews='source ${WORKSPACE_DIR}/install/setup.bash'" >> ~/.bashrc



##################################
####### Dev tools layer ##########
##################################
FROM ros as dev

# Docker args
ARG ROS_DISTRO
ARG USER_DIR
ARG ITOOLS
ARG IFRAMEWORKS
ARG IROSTOOLS


# INSTALLING PKGS

## Updating packages
RUN sudo apt update && sudo apt upgrade -y

## Installing frameworks and tools installation script
RUN mkdir /tmp/scripts && chmod +x -R /tmp/scripts 
COPY scripts /tmp/scripts
RUN cd /tmp/scripts && \
    ./tools.bash && \
    ./frameworks.bash && \
    ./rostools.bash