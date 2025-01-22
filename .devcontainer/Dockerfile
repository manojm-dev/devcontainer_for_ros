ARG ROS_DISTRO

##################################
######## ROS2 IMAGE ##############
##################################
FROM ros:humble as ros 
#issue always chooses jazzy(default) even thought when we give humble via docker args

# Docker Arguments
ARG RMW_IMPLEMENTATION
ARG USER_USERNAME
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
RUN apt update && apt install -y python3-virtualenv && virtualenv --system-site-packages $VIRTUAL_ENV

# Check if any user already exist with same UID and delete it
RUN if id -u $USER_UID ; then userdel `id -un $USER_UID` ; fi

# Create the user and login
RUN groupadd --gid ${USER_GID} ${USER_USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USER_USERNAME} \
    && echo ${USER_USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USER_USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USER_USERNAME} \
    && chown -R ${USER_USERNAME}:${USER_USERNAME} /home/${USER_USERNAME}

USER ${USER_USERNAME}

# Giving permissions
RUN sudo chown -R ${USER_USERNAME}:${USER_USERNAME} /opt/
RUN sudo chown -R ${USER_USERNAME}:${USER_USERNAME} /home/${USER_USERNAME}/

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



##################################
########### Dev layer ############
##################################
FROM tools as dev

# Updating packages
RUN sudo apt-get update &&  sudo apt upgrade -y


# AUDIO

## Installing pulseaudio 
RUN sudo apt-get install -y pulseaudio-utils 
COPY ./files/pulse-client.conf /etc/pulse/client.conf

## Giving permission for audio
RUN sudo gpasswd -a ${USER_USERNAME} audio

## Tools to play audio using terminal(pacat), python(playsound & its dep), c++(notyet)
RUN pip install playsound pygobject

## Installing gstreamer and its plugins(playsound dep)
RUN sudo apt-get install -y gstreamer1.0-tools gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-libav gir1.2-gstreamer-1.0 