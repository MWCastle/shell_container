FROM ubuntu:20.04

RUN apt-get clean && apt-get update

WORKDIR /cwd

ENTRYPOINT ["/bin/bash"]