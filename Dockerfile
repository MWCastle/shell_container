FROM ubuntu:20.04

COPY . ../oompa_loompas ../2.0_tools /cwd/

WORKDIR /cwd

RUN apt-get clean && apt-get update \
    && apt-get -y install gnupg2 \
    && apt-get -y install curl \
    && apt-get install net-tools \
    && gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
    && \curl -sSL https://get.rvm.io -o rvm.sh \
    && cat rvm.sh | bash -s stable --rails \
    && bash -s source /usr/local/rvm/scripts/rvm \
    && bash -s source /etc/profile.d/rvm.sh \
    && bash -s rvm install 2.7.4 \
    && bash -s rvm use 2.7.4 \
    && bash -s gem install bundler -v 2.4.7 \
    && bash -s gem install rails -v 7.0.2 \
    && bash -s bundle install


ENTRYPOINT ["/cwd/bin/run.sh"]