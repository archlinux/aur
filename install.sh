#!/bin/sh

unzip -X -K matlab_*_glnxa64.zip -d matlabroot
mv matlabroot/bin/glnxa64/libfreetype.so.6 \
   matlabroot/bin/glnxa64/libfreetype.so.6.MATLAB
./matlabroot/install
date_dir=`echo matlab/*`
mv $date_dir/* matlab/
rmdir $date_dir
tar -I zstd -cvf matlab.tar matlab
makepkg -s
