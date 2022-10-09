# Maintainer: Unitythecoder



pkgname="voxel-lang"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Voxel Programming Language Installer"
arch=("x86_64")
url="https://github.com/UnityTheCoder/Voxel"
license=("custom")
depends=(python3 python-pip)
package () {
    sh -c "sudo rm -r /usr/lib/voxel; exit 0"
    sudo git clone https://github.com/UnityTheCoder/Voxel /usr/lib/voxel
    make -C /usr/lib/voxel setup
    sh -c "sudo rm /usr/bin/vxc; exit 0"
    sudo ln -s /usr/lib/voxel/voxel /usr/bin/vxc
}
