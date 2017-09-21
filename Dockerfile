# Dockerfile for building an Ansible control node for Network Automation
# Ubuntu 16.04 base image
# v1.0
#

# Base image
FROM ubuntu:16.04

LABEL maintainer="mrtheplague"

ADD . /tmp
WORKDIR /tmp

RUN DEBIAN_FRONTEND=noninteractive  apt-get update

RUN echo "** Installing Python-Pip **"
RUN apt-get install -y python-pip

RUN echo "** Installing Ansible, Napalm, and Napalm-Ansible **"
RUN pip install -r requirements.txt

WORKDIR /

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
