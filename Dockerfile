FROM ubuntu:latest

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install necessary packages
RUN apt-get update \
 && apt-get install -y sudo avahi-daemon git \
 && adduser --disabled-password --gecos '' wirepod \
 && adduser wirepod sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && mkdir /wire-pod \
 && chown -R wirepod:wirepod /wire-pod

USER wirepod
WORKDIR /wire-pod

# Clone the repository
RUN git clone https://github.com/kercre123/wire-pod/ .

# Run setup with automatic input or preconfigured environment variables
RUN STT=vosk sudo ./setup.sh --non-interactive

WORKDIR /wire-pod/chipper

# Start the service
CMD ./start.sh
