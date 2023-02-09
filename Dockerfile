FROM ubuntu:20.04

RUN apt-get clean && apt-get update && apt-get install net-tools

WORKDIR /cwd

ENTRYPOINT ["/bin/bash"]