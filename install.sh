#!/bin/sh

unzip -X -K matlab_*_glnxa64.zip -d MATLABROOT
mv MATLABROOT/bin/glnxa64/libfreetype.so.6 \
   MATLABROOT/bin/glnxa64/libfreetype.so.6.MATLAB
./MATLABROOT/install
date_dir=`echo matlab/*`
mv $date_dir/* matlab/
rmdir $date_dir
tar -I zstd -cvf matlab.tar matlab
makepkg -s
