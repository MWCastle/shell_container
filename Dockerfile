FROM ubuntu:20.04

COPY . /cwd/

WORKDIR /cwd

RUN apt-get clean && apt-get update \
    #### DEPENDENCIES ####
    && apt-get install -y build-essential curl net-tools checkinstall zlib1g-dev
    ### OPENSSL INSTALLATION #### \
     # WAS A WGET COMMAND
RUN bash -s wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz \
    && /usr/bin/tar -xvf openssl-1.1.1k.tar.gz \
    && cd ./openssl-1.1.1k && ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib && /usr/bin/make && /usr/bin/make test  && /usr/bin/make install && cd .. \
    #### RUBY 3.1.2 INSTALLATION ####
    && /usr/bin/curl -sSo ruby-3.1.2.tar.gz https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz \
    && /usr/bin/tar -xvf ruby-3.1.2.tar.gz \
    && cd ./ruby-3.1.2 && ./configure && /usr/bin/make && /usr/bin/make install
    #### GEM MANAGEMENT ####
    #&& gem update
    # && gem install faraday
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


RUN bash -s gem install rails -v 7.0.2 \
    && bash -s gem install csv \
    && bash -s gem install faraday_middleware \
    && bash -s gem install json \
    && bash -s gem install rubyXL

ENTRYPOINT ["/cwd/bin/run.sh"]