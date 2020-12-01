## Prerequisites
```
sudo apt-get install build-essential debhelper devscripts
```

## Step packet version

```
cd openocd-gw
dch -v '<new version number>'
dch -r
```

## Build a deb files
```
cd openocd-gw
dpkg-buildpackage --no-sign -j<job number>
```

## Check contenst of created deb
```
dpkg --contents <package>_<version>_amd64.deb
```

