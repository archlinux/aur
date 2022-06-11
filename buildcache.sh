#!/bin/bash
sudo mkdir -p /usr/lib/buildcache/bin
cd  /usr/lib/buildcache/bin
sudo ln -s /usr/bin/buildcache x86_64-pc-linux-gnu-g++
sudo ln -s /usr/bin/buildcache x86_64-pc-linux-gnu-c++
sudo ln -s /usr/bin/buildcache x86_64-pc-linux-gnu-gcc
sudo ln -s /usr/bin/buildcache x86_64-pc-linux-gnu-c
sudo ln -s /usr/bin/buildcache cc
sudo ln -s /usr/bin/buildcache c++
sudo ln -s /usr/bin/buildcache clang++
sudo ln -s /usr/bin/buildcache clang
sudo ln -s /usr/bin/buildcache g++
sudo ln -s /usr/bin/buildcache gcc
