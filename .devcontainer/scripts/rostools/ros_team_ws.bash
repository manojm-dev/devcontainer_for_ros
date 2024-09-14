#!/bin/bash

# Location of the repository
location='/opt/ros_team_workspace'

# Clone the repository
git clone https://github.com/StoglRobotics/ros_team_workspace.git $location

# Source ros_team_workspace
echo '# sourcing ros_team_workspace' >> ~/.bashrc
echo "source $location/setup.bash" >> ~/.bashrc

# Setup auto sourcing without color
echo -e "yes\nno" | setup-auto-sourcing

# export rtw folder location
echo "export RTW=\"$location\"" >> ~/.bashrc