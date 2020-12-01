#!/bin/bash

set -xe

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y \
    build-essential debhelper devscripts equivs \
    debhelper git texinfo pkg-config \
    libusb-dev libusb-1.0-0-dev libusb-dev libhidapi-dev libftdi-dev libftdi1-dev \
    libusb-0.1-4 libusb-1.0-0 libftdi1 libftdi1-2 libhidapi-hidraw0

cd openocd-git

# This checks out the repository so we can export the git hash of the HEAD commit
make openocd
cd openocd
VERSION=$(git describe --tags --long | cut -d"v" -f2)
cd ..

rm -f debian/changelog

export DEBFULLNAME="Docker Build Bot"
export DEBEMAIL="docker@localhost"

dch --create --distribution unstable --package "openocd-git" \
    --newversion $VERSION "openocd-git"

dpkg-buildpackage --no-sign -j$(nproc)

