# Dockerfile for building an Ansible control node for Network Automation
# Ubuntu 16.04 base image
# v1.0
#

# Base image
FROM alpine:3.7

LABEL maintainer="mrtheplague"

ADD . /tmp
WORKDIR /tmp

RUN echo "** Installing Dependencies **"
RUN apk add --update gcc \
    musl-dev \
    libffi-dev \
    python \
    python-dev \
    py-pip \
    make \
    openssl-dev \
    py-lxml

RUN echo "** Installing Ansible, Napalm, and Napalm-Ansible **"
RUN pip install -r requirements.txt

WORKDIR /