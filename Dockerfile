FROM ubuntu:latest AS base

RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install unzip

FROM base

WORKDIR /root/.dotfiles

COPY . /root/.dotfiles

RUN ./INSTALL.sh