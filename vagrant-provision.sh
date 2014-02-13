#!/bin/sh

apt-get update -y
apt-get install -y curl vim git
curl -s https://get.docker.io/ubuntu/ | sh

