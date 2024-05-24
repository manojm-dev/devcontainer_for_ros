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
    curl \
    tmux \
    ros-dev-tools

# Sourcing
RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc && \
    echo 'export PATH=/opt/venv/bin:$PATH' >> ~/.bashrc && \
    echo 'source /usr/share/gazebo/setup.bash' >> ~/.bashrc && \
    echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc

# Install ros2 tools
RUN apt-get install -y \
    gazebo\
    ~nros-humble-rqt*

# Dependencies

# Colcon build requirements
RUN /opt/venv/bin/pip install \
    catkin_pkg \
    empy==3.3.4 \
    lark 

## rqt through ros2
RUN /opt/venv/bin/pip install \
    PyQt5 PySide2 pydot

## nav2
RUN /opt/venv/bin/pip install \
    numpy

