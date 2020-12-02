# Nightly openocd-git build for Ubuntu 20.04

This repository uses github actions to build openocd from the master branch each night.

It installs into `/opt/openocd-git`, so you don't have to worry about conflicts with the `openocd` package in case it's already installed. This package also installs udev rules.

To install this artifact, do the following:

```
wget https://nightly.link/kbeckmann/ubuntu-openocd-git-builder/workflows/docker/master/openocd-git.deb.zip
unzip openocd-git.deb.zip
sudo dpkg -i openocd-git_*_amd64.deb
sudo apt-get -y -f install
```

Now you can execute openocd using `/opt/openocd-git/bin/openocd`.

## Prerequisites
```
sudo apt-get install build-essential debhelper devscripts
```

## Step packet version

```
cd openocd-git
dch -v '<new version number>'
dch -r
```

## Build a deb files
```
cd openocd-git
dpkg-buildpackage --no-sign -j<job number>
```

## Check contenst of created deb
```
dpkg --contents <package>_<version>_amd64.deb
```

