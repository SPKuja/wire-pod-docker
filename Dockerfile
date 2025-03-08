FROM ubuntu:latest

ENV TZ=Europe/London
ENV DATA_DIR=/wire-pod/data

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install necessary packages
RUN apt-get update \
 && apt-get install -y sudo avahi-daemon git rsync \
 && adduser --disabled-password --gecos '' wirepod \
 && adduser wirepod sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && mkdir -p /wire-pod /wire-pod/data \
 && chown -R wirepod:wirepod /wire-pod

VOLUME /wire-pod/data

USER wirepod
WORKDIR /wire-pod

# Ensure latest repository version is fetched when container starts
CMD if [ -d ".git" ]; then \
        git pull; \
    else \
        git clone https://github.com/kercre123/wire-pod.git /tmp/wire-pod && \
        rsync -a --exclude=data /tmp/wire-pod/ /wire-pod/ && \
        rm -rf /tmp/wire-pod; \
    fi && \
    echo "3" | STT=vosk DATA_DIR=$DATA_DIR sudo ./setup.sh --non-interactive && \
    cd /wire-pod/chipper && \
    DATA_DIR=$DATA_DIR sudo ./start.sh
