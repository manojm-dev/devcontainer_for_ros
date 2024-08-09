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

1) Adding few variables and cmd to `.profiles` file to give gui access for the container
- Open `~/.profiles` file in a text editor and add the below lines
```
# docker
xhost +SI:localuser:$USER

# devcontainer
export DISPLAY_NUM=${DISPLAY#:}

# after exiting source .profile for first time only
source ~/.profile
```

2) Clone this repository and open in `vscode`
```
git clone https://github.com/manojm-dev/devcontainer_for_ros.git ros_ws
cd ros_ws && code .
```
3) Open the `.env` file placed inside the `.devcontainer` folder for adding or removing pkg as per your need.
- Example
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
4) Opening the devcontianer
- Press `Control + Shift + P` to open `Command Pallete`
- Find `Dev Containers: Reopen in Container` and click to the lanch the devcontainer environment

5) Using the devcontainer on daily basis
- When ever you open this folder in vscode `Reopen in Container` dialog box will appear just click on it to resume from where you left off
![image](https://github.com/user-attachments/assets/56d16332-74da-4542-9209-ef45ccbd4a72)


