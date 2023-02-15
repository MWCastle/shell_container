FROM ubuntu:20.04

COPY . /cwd

WORKDIR /cwd

RUN apt-get clean && apt-get update && apt-get install ruby3.0 && apt-get install net-tools && bundle install

ENTRYPOINT ["/bin/bash"]