# docker-for-wslg

This is a minimal template for developing a Kivy project on Docker Container using WSLg (Windows Subsystem for Linux GUI). 

## Require

- Windows 11
- WSL2
- Docker Desktop 
  - docker
  - docker-compose

## Installation

```
docker-compose up -d --build
docker-compose exec kivy-wslg /bin/bash
```

## Try!

You can use the following commands to execute test project with WSLg on Docker Container.

```
poetry run python app/main.py
```
