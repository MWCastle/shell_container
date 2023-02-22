FROM ubuntu:20.04

COPY . /cwd/

WORKDIR /cwd

RUN apt-get clean && apt-get update \
    && apt-get install -y build-essential\
    && apt-get -y install curl \
    && apt-get install net-tools \
    && /usr/bin/curl -sSo ruby-3.1.2.tar.gz https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz \
    && /usr/bin/tar -xvf ruby-3.1.2.tar.gz

RUN bash -s cd ./ruby-3.1.2 && bash -s ./configure && echo $?
RUN usr/bin/make && usr/bin/make install
    #&& bash -s make && bash -s make install
#    && gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
#    7D2BAF1CF37B13E2069D6956105BD0E739499BDB \
#    && \curl -sSL https://get.rvm.io -o rvm.sh \
#    && cat rvm.sh | bash -s stable --rails \
#    && bash -s source /usr/local/rvm/scripts/rvm \
#    && bash -s source /etc/profile.d/rvm.sh \
#    && bash -s rvm install 3.1.2 \
#    && bash -s rvm use 3.1.2

#RUN ["/bin/bash", "-c", "source /usr/local/rvm/scripts/rvm", "rvm install 3.1.2", "rvm use 3.1.2"]


RUN bash -s gem install bundler -v 2.4.7 \
    && bash -s gem install rails -v 7.0.2 \
    && bash -s gem install csv \
    && bash -s gem install faraday_middleware \
    && bash -s gem install json \
    && bash -s gem install rubyXL


RUN bash -s gem install faraday


ENTRYPOINT ["/cwd/bin/run.sh"]