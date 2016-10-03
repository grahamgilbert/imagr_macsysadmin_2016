#!/bin/bash

# Make sure curl is installed
# apt-get update -y
# apt-get install -y curl

# Install Docker - DO NOT DO THIS IN PROD, I'M LAZY
# curl -sSL https://get.docker.com/ | sh

# Initial pull of the images
# docker pull grahamgilbert/proxy
# docker pull macadmins/tftpd
# docker pull bruienne/bsdpy:1.0

# Delete all of our existing containers, they're disposable
docker ps -aq | xargs docker rm -f

# Lazy
IP="192.168.33.10"


# Start the web server
docker run -d \
  -v "/vagrant":/usr/local/nginx/html \
  -v "/vagrant/sites-templates":/etc/nginx/sites-templates \
  --name="web" \
  --restart="always" \
  -p 0.0.0.0:80:80 \
  grahamgilbert/proxy


docker run -d \
  -p 0.0.0.0:69:69/udp \
  -v "/vagrant/nbi":/nbi \
  --name "tftpd" \
  --restart="always" \
  macadmins/tftpd

docker run -d \
  -p 0.0.0.0:67:67/udp \
  -v "/vagrant/nbi":/nbi \
  -e BSDPY_IFACE=eth0 \
  -e BSDPY_NBI_URL=http://$IP/nbi \
  -e BSDPY_IP=$IP \
  --name "bsdpy" \
  --restart="always" \
  bruienne/bsdpy:1.0
