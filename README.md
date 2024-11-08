# README

A build of keepalived for openrc deployment - nothing fancy, nothing special.


### Install

Most installations of this package will likely be on a server (which likely is not using or have a user account). If this is the case you can install as nobody user as follows:

1. install needed dependencies: `pacman -S gcc openssl libnl net-snmp git`
2. create a build directory and set it up to be owned by the nobody user
```
mkdir /home/build \
  && chgrp nobody /home/build \
  && chmod g+ws /home/build \
  && setfacl -m u::rwx,g::rwx /home/build \
  && setfacl -d --set u::rwx,g::rwx,o::- /home/build
```
3. Now you can clone and build:
```
git clone https://gitlab.com/drad/keepalived.git \
  && cd keepalived \
  && sudo -u nobody makepkg -c \
  && ls -lh keepalived*.zst
```
4. Finally install: `pacman -U keepalived-openrc-{version-arch}.pkg.tar.zst`

Optionally, you can installed the usual AUR way:
```
git clone https://gitlab.com/drad/keepalived.git \
  && cd keepalived \
  && makepkg -sirc
```


### Update

__NOTICE:__ installing with `paru` (or another aur helper) should work fine.

1. Update & Build
```
cd /home/build/keepalived \
  && git pull \
  && sudo -u nobody makepkg -c \
  && ls -lh keepalived*.zst
```
2. Install: `pacman -U keepalived-openrc-{version-arch}.pkg.tar.zst`

### Remove

Remove with: `pacman -R keepalived-openrc`
