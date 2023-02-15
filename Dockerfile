FROM ruby:3.1.2

COPY . /cwd

WORKDIR /cwd

RUN apt-get clean && apt-get update && apt-get install net-tools && bundle install

ENTRYPOINT ["/bin/bash"]