#!/bin/bash

# Location of the repository
location='/opt/ros_team_workspace'

# Clone the repository
git clone https://github.com/StoglRobotics/ros_team_workspace.git $location

echo '# sourcing ros_team_workspace' >> ~/.bashrc
echo "source $location/setup.bash" >> ~/.bashrc

# export rtw folder location
echo "export RTW=\"$location\"" >> ~/.bashrc