# Navigation2 Devcontainer 
This repository contains a development container setup for the Nav2 (Navigation2) environment, facilitating an easy and consistent setup for development.

## Table of Contents
- Prerequisites
- Setup Instructions
- Usage
- Configuration
- Contributing
- License

## Prerequisites
Before you begin, ensure you have the following installed:

- Docker
- Visual Studio Code
- Visual Studio Code Remote - Containers extension

## Setup Instructions
1) Clone the repository
   ```
   git clone https://github.com/manojm-dev/nav2-devcontainer.git nav_ws
   git checkout humble
   cd nav_ws
   ```
2) Create Source dir
   ```
   mkdir -p ws/src
   (or)
   git clone https://github.com/example.repo ws/src
   ```
3) Open the repository in vscode
   ```
   code .
   ```
4) Reopen in container
   - Click on reopen in container when asked
   - If not asked or it faded then, press `ctr + shift + p` then type `Dev Container: Rebuild and Reopen in container`
     
## Usage
Once the container is up and running, you can start working with the Nav2 environment. The container includes all necessary dependencies and tools pre-installed.

## Configuration
The development container configuration is defined in the .devcontainer folder. You can customize the Dockerfile and devcontainer.json to fit your specific needs.

### [Dockerfile](https://github.com/manojm-dev/nav2-devcontainer/blob/humble/.devcontainer/devcontainer.json)
The Dockerfile defines the environment, including the base image and any additional dependencies.

### [devcontainer.json](https://github.com/manojm-dev/nav2-devcontainer/blob/humble/.devcontainer/devcontainer.json)
The devcontainer.json file configures VS Code's settings and extensions.

### [compose.yaml](https://github.com/manojm-dev/nav2-devcontainer/blob/humble/.devcontainer/docker-compose.yml)
The compose.yaml file configures container-specific settings. By default is uses my docker images uploaded in docker hub, if you wish that docker image to be build locally you may configure it in compose.yaml by.
```
step1:
# commenting this line by adding '#' before it
   # 1)From images
-> image: manojm003/ros:humble-nav2

step2:
# and uncommenting these lines removing '#' before it
   # 2)From dockerfile
-> # build:
-> #     context: .
-> #     dockerfile: dockerfile

```
## Contributing
Contributions are welcome! Please fork the repository and use a feature branch. Pull requests are reviewed actively.

- Fork the repository
- Create a new branch (git checkout -b feature-branch)
- Make your changes
- Commit your changes (git commit -am 'Add new feature')
- Push to the branch (git push origin feature-branch)
- Create a new Pull Request

## License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/manojm-dev/nav2-devcontainer/blob/humble/LICENSE) file for details.
