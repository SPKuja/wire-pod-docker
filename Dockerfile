FROM ubuntu
RUN useradd -d /wire-pod wire-pod
RUN apt-get update && apt-get install -y git
RUN mkdir /wire-pod
RUN chown -R wire-pod:wire-pod /wire-pod
USER wire-pod
RUN cd /wire-pod
RUN git clone https://github.com/kercre123/wire-pod/ wire-pod
RUN cd wire-pod
CMD ./setup.sh
