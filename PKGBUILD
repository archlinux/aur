# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=freeroute-git
pkgver=1.2.43.752065a
pkgrel=1
pkgdesc="Automatic PCB track router for KiCad written by Alfons Wirtz"
arch=('i686' 'x86_64')
url="http://www.freerouting.net/"
license=('GPL3')
depends=('java-runtime')
optdepends=('kicad: for use with PCB editor')
source=("https://github.com/freerouting/freerouting/raw/master/binaries/FreeRouting.jar")
noextract=('FreeRouting.jar')
md5sums=('212b8886718d0a7b62b57c51362cdcf7')

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/FreeRouting.jar ${pkgdir}/usr/bin/freeroute.jar
}
