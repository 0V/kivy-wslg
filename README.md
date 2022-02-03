# kivy-wslg-dev

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

If you see the following window, it's working.  

![image](https://user-images.githubusercontent.com/7000978/152284906-8e178357-7dae-441e-9663-991a674876b6.png)

