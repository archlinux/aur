# Maintainer: Unitythecoder



pkgname="holyc"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="An aur package for HolyC Compiler by Alistair-Bell"
arch=("x86_64")
url="https://github.com/Alistair-Bell/HolyC-Compiler"
license=("custom")
depends=(make git)
package () {
    sh -c "git clone https://github.com/Alistair-Bell/HolyC-Compiler /tmp/holyc; make -C /tmp/holyc all && sudo make -C /tmp/holyc install"
 }

