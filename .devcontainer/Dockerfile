ARG ROS_DISTRO

##################################
######## ROS2 IMAGE ##############
##################################
FROM ros:${ROS_DISTRO} as ros

# Docker Arguments
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
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

## virtualenv
RUN apt update && apt install -y python3-virtualenv && virtualenv $VIRTUAL_ENV

# Check if any user already exist with same GID and delete it
RUN awk -v gid="${USER_GID}" -F':' '$4 == gid {print $1}' /etc/passwd | xargs -r userdel -r

# Create the user and login
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

USER ${USERNAME}

# Giving permissions
RUN sudo chown -R ${USERNAME}:${USERNAME} /opt/venv

# Creating Workspace
RUN mkdir -p ${WORKSPACE_DIR}/src


# INSTALLING PKGS

## Basic pkgs
RUN sudo apt install -y \
    nano curl python3-pip ros-dev-tools

## Copying installation script
RUN mkdir /tmp/scripts && chmod +x -R /tmp/scripts 
COPY scripts /tmp/scripts

    
# SOURCING PKGS

## adding source to bashrc
RUN echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc && \
    echo 'source ${WORKSPACE_DIR}/install/setup.bash' >> ~/.bashrc && \
    echo "alias sourcews='source ${WORKSPACE_DIR}/install/setup.bash'" >> ~/.bashrc



##################################
###### Frameworks Layer ##########
##################################
FROM ros as rosframeworks

# Docker args
ARG IFRAMEWORKS

# Updating packages
RUN sudo apt update && sudo apt upgrade -y

# Installing frameworks
WORKDIR /tmp/scripts 
RUN ./frameworks.bash 



##################################
######### Tools layer ############
##################################
FROM rosframeworks as rostools

# Docker args
ARG IROSTOOLS

# Updating packages
RUN sudo apt update && sudo apt upgrade -y

# Installing ros tools
WORKDIR /tmp/scripts 
RUN ./rostools.bash



##################################
######### Tools layer ############
##################################
FROM rostools as tools

# Docker args
ARG ITOOLS

# Updating packages
RUN sudo apt update && sudo apt upgrade -y

# Installing Tools
WORKDIR /tmp/scripts 
RUN ./tools.bash


FROM tools as dev