FROM ubuntu:16.04
MAINTAINER Michael Christenson II <m3talsmith@gmail.com>

RUN apt-get update && apt-get install -yq build-essential python-software-properties git imagemagick libmagickcore-dev libmagickwand-dev libyaml-dev libssl-dev wget
RUN mkdir /src && cd /src && wget https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
WORKDIR /src
RUN tar -zxvf ruby-1.9.3-p194.tar.gz
WORKDIR /src/ruby-1.9.3-p194
RUN ./configure
RUN make && make install
RUN ruby ./ext/openssl/extconf.rb
RUN gem install bundler --no-ri --no-rdoc
