#!/usr/bin/env bash

set -euxo pipefail

# Check the PKGBUILD
namcap PKGBUILD

# Check that .SRCINFO has been updated
makepkg --printsrcinfo > /tmp/SRCINFO
diff .SRCINFO /tmp/SRCINFO
changed_lines=$(diff .SRCINFO /tmp/SRCINFO | wc -l)
if [ "$changed_lines" != "0" ]; then
    exit 1
fi

# Try building and installing the package
makepkg --log --check --syncdeps --noconfirm --install --syncdeps

# Try using the package
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
./hello_world > actual_output.txt
diff ../reference_output.txt actual_output.txt
changed_lines=$(diff ../reference_output.txt actual_output.txt | wc -l)
if [ "$changed_lines" != "0" ]; then
    exit 1
fi
