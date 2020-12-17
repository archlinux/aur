#!/usr/bin/bash

# The Kyocera and UTAX PPD are redistributable by MIT license.
# All old Kyocera models are in the new package. We only need the UTAX TA models.
# The filter does not say if it is redistributable or not
# so we'll treat it with the same license as the PPD files that use it.

# Let's repack them without the files we don't use.

set -e
set -u

rm -rf 'repack.dir'
mkdir 'repack.dir'
cd 'repack.dir'
bsdtar -xf '../Kyocera Linux PPD Ver 8.1404.tar.gz'
cd 'Kyocera Linux PPD Ver 8.1404'
bsdtar -C '..' -xf 'TALinuxPackages-20141229.tar.gz'
cd '../LinuxPackagesTA'
if :; then
  find . -depth -type 'd' -name 'bintools' -exec rm -r '{}' ';'
  find . -type 'f' -name 'install.sh' -delete
fi
cd ..
# https://stackoverflow.com/questions/27457326/compressing-a-folder-with-many-duplicated-files
# This never produces the same md5 twice
# Almost comical how small this file really can be
7za a -r -t7z -m0=lzma2 -mx=9 -mfb=273 -md=29 -ms=8g -mmt=off -mmtf=off -mqs=on -bt -bb3 'TALinuxPackages-20141229-Repack.7z' 'LinuxPackagesTA'
7z t 'TALinuxPackages-20141229-Repack.7z'
