# Devcontainer for ros

![image](https://github.com/user-attachments/assets/0921eae7-377c-4dc1-bf0b-44b199e1c078)


## Compatability

- Linux (x11)
- Linux (wayland)

## Requirements

- Docker 
- Visual Studio Code (vscode)
- Remote Development vscode plugin

## Steps

- Exporting some required variables to .profiles

```
# open .profiles file in nano and add these lines
cd && nano .profile

# docker
xhost +SI:localuser:$USER

# devcontainer
export DISPLAY_NUM=${DISPLAY#:}

# after exiting source .profile for first time only
source ~/.profile

```

- Edit .env file to add or remove tools, rostools and frameworks.
- Example:

```
# ROS Frameworks
# ros2_control
# nav2
# plansys2

# 1) you can add or remove pkg listed above 
# 2) Don't forget to add `&&` when adding a another pkg trailing to it
# 3) Also add `$` before the pkg name 
IFRAMEWORKS='$ros2_control && $nav2'
```
