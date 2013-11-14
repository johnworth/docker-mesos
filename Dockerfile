# Docker-Verson 0.7

From ubuntu
MAINTAINER Michael Whitehead <whitehead1415@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y -q autoconf make gcc cpp patch python-dev git libtool gzip libghc-zlib-dev libcurl4-openssl-dev build-essential openjdk-7-jre-headless

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN git clone https://github.com/apache/mesos.git
RUN (cd mesos && ./bootstrap)
RUN (cd mesos && ./configure --with-webui --with-included-zookeeper --disable-perftools)
RUN (cd mesos && make)
Run (cd mesos && make install)


