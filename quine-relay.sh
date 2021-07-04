#!/bin/sh
echo 'Entering ~/.quine-relay'
mkdir -p ~/.quine-relay
echo 'Installing the scanf ruby gem'
gem install scanf
cp -rfu /usr/share/quine-relay/* ~/.quine-relay
cd ~/.quine-relay
export CC=tcc
export CXX='g++ -std=c++11'
time make
