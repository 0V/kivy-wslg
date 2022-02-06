FROM python:3.9

RUN apt-get update

# Set your user name
ARG DOCKER_USER=user

ARG WORK_DIR=/opt
WORKDIR ${WORK_DIR}

RUN apt-get install -y sudo libgl1-mesa-dev libmtdev-dev
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

# Add a super user who is not named root
RUN echo "root:root" | chpasswd && \
    adduser --disabled-password --gecos "" "${DOCKER_USER}" && \
    echo "${DOCKER_USER}:${DOCKER_USER}" | chpasswd && \
    echo "%${DOCKER_USER}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers.d/${DOCKER_USER} && \
    chmod 0440 /etc/sudoers.d/${DOCKER_USER} 
RUN chown ${DOCKER_USER}:${DOCKER_USER} ${WORK_DIR}
USER ${DOCKER_USER}

# Install poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
ENV PATH /home/${DOCKER_USER}/.poetry/bin:$PATH

COPY pyproject.toml /opt
RUN /home/${DOCKER_USER}/.poetry/bin/poetry install && rm pyproject.toml 


CMD ["/bin/bash"]

