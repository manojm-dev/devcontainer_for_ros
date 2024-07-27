# Devcontainer for ros

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
cd && nano .profiles

# docker
xhost +SI:localuser:$USER

# devcontainer
export DISPLAY_NUM=${DISPLAY#:}

```