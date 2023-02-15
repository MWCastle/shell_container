FROM ruby:3.1.2

COPY . /cwd

RUN apt-get clean && apt-get update && apt-get install net-tools && bundle install

WORKDIR /cwd

ENTRYPOINT ["/bin/bash"]