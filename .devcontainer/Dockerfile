FROM osrf/ros:humble-desktop-full

# Setup virutal env 
RUN mkdir /opt/venv && \
    apt update && apt upgrade -y && \
    apt install -y \
    python3-pip && \
    pip install virtualenv && \
    virtualenv /opt/venv && \
    export PATH="/opt/venv/bin:$PATH"

# Install Basic Tools
RUN apt install -y \
    nano \
    cmake \
    curl \
    wget \
    git \
    tmux \
    python3-rosdep \
    python3-vcstool \
    python3-colcon* 

# Sourcing
RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc && \
    echo 'export PATH=/opt/venv/bin:$PATH' >> ~/.bashrc && \
    echo 'source /usr/share/gazebo/setup.bash' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc

# Install Nav2
RUN apt-get install -y \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup

# Basic ros2 tools
RUN apt-get install -y \
    gazebo \
    ~nros-humble-rqt*

# Install ros2 extra pkgs
RUN apt-get install -y ros-humble-turtlebot3-gazebo

# Dependencies

## Colcon build 
RUN /opt/venv/bin/pip install \
    catkin_pkg empy==3.3.4 lark 

## rqt through ros2
RUN /opt/venv/bin/pip install \
    PyQt5 PySide2 pydot
