# Maintainer: Unitythecoder



pkgname="holyc"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="An aur package for HolyC Compiler by nrootconauto"
arch=("x86_64")
url="https://github.com/nrootconauto/HolyCC2"
license=("custom")
depends=(make cmake git)
package () {
    sh -c "git clone --recursive https://github.com/nrootconauto/HolyCC2.git /tmp/holyc; cd /tmp/holyc; mkdir build; cd build; cmake ..; sudo make install"
 }

