#!/bin/sh
sed -i.bak '{ s/.*fl_wait(double).*//g; s/fl_wait/Fl::wait/g }' remote.cpp
sed -i.bak 's/\(objUnderMouse = \)false/\1NULL/g' Flu_DND.cpp

