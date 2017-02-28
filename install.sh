#!/bin/bash

VER=1.8
OS=linux
ARCH=amd64
FILE="go${VER}.${OS}-${ARCH}.tar.gz"

cd /usr/local
wget https://storage.googleapis.com/golang/${FILE}
tar xvfz ${FILE}
rm -rf ${FILE}

if [ "$(grep '/usr/local/go/bin' /etc/profile)" == "" ]; then
    echo 'export PATH=/usr/local/go/bin:$PATH' >> /etc/profile
fi

if [ ! -d ~/go ]; then
    mkdir ~/go
fi

if [ "$(grep '${HOME}/go' ~/.bash_profile)" == "" ]; then
    echo 'export GOPATH=${HOME}/go' >> ~/.bash_profile
fi

exit 0

