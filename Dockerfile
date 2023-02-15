FROM ruby:3.1.2

RUN apt-get clean && apt-get update && apt-get install net-tools && bundle install

WORKDIR /cwd

ENTRYPOINT ["/bin/bash"]