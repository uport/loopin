#! /bin/bash

sudo sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y --force-yes software-properties-common && \
  apt-get install -y systemd-sysv byobu cgroup-lite cgroup-bin curl git mercurial subversion htop man unzip vim wget mc zsync ssh snapper xz-utils
