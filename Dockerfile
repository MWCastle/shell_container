FROM ubuntu:20.04
# TODO: Need to check dependency and gem versions and specify them here
COPY . /cwd/

WORKDIR /cwd

#### DEPENDENCIES ####
RUN apt-get clean && apt-get update \
    && apt-get install -y build-essential curl libssl-dev net-tools checkinstall wget zlib1g-dev

#### RUBY 3.1.2 INSTALLATION ####
RUN /usr/bin/curl -sSo ruby-3.1.2.tar.gz https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.2.tar.gz \
    && /usr/bin/tar -xvf ruby-3.1.2.tar.gz \
    && cd ./ruby-3.1.2 && ./configure && /usr/bin/make && /usr/bin/make install

#### GEM MANAGEMENT ####
RUN gem install faraday faraday_middleware rubyXL

# && useradd se-xy_shuttle -u 1002 -g 1002
# RUN /usr/bin/bash groupadd -g 1002 && echo $?
# RUN useradd -u $(id -u) se-xy_shuttle
RUN groupadd -g $(id -g) se-xy_shuttle
RUN echo $(id -g)
USER se-xy_shuttle

#RUN bash -s gem install rails -v 7.0.2 \

ENTRYPOINT ["/cwd/bin/run.sh"]