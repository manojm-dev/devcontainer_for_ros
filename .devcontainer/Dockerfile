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
    git \
    tmux