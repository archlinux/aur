#!/bin/bash

sudo -v
## Bug with openGL populate
sudo mv /usr/lib/x86_64-linux-gnu/libGL.so /usr/lib/x86_64-linux-gnu/baklibGL.so
sudo ldconfig

## Maya does not need sudo to run
oriMaya

sudo mv /usr/lib/x86_64-linux-gnu/baklibGL.so /usr/lib/x86_64-linux-gnu/libGL.so
sudo ldconfig