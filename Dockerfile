FROM ubuntu:20.04

COPY . /cwd

WORKDIR /cwd

RUN apt-get clean && apt-get update \
    && apt-get -y install gnupg2 \
    && apt-get -y install curl \
    && gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
    && \curl -sSL https://get.rvm.io -o rvm.sh \
    && cat rvm.sh | bash -s stable --rails \
    && source ../usr/local/rvm/scripts/rvm \
    && rvm install 2.7.4 && rvm use 2.7.4 \
    && gem install bundler -v 2.4.7 \
    && gem install rails -v 7.0.2 \
    && apt-get install net-tools && bundle install

ENTRYPOINT ["/bin/bash"]