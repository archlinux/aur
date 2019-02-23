#!/usr/bin/env sh

set -euxo pipefail

# Check the PKGBUILD
namcap PKGBUILD

# Check that .SRCINFO has been updated
makepkg --printsrcinfo > /tmp/SRCINFO
changed_lines=$(diff .SRCINFO /tmp/SRCINFO | wc -l)
(( changed_lines == 0 )) ||
    (diff .SRCINFO /tmp/srcinfo && exit 1)

# Try building and installing the package
makepkg --log --check --syncdeps --noconfirm --install --syncdeps

# Try using the package
mkdir -p build
pushd build
cmake ..
make
./hello_world > actual_output.txt
changed_lines=$(diff ../reference_output.txt actual_output.txt | wc -l)
(( changed_lines == 0 )) ||
    (diff ../reference_output.txt actual_output.txt && exit 1)
popd
