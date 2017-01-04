# Maintainer: Florian Reinhard <f.reinhard42@gmail.com>
# Updater: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.13.2
pkgrel=4
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
license=()
groups=()
depends=('qt5-base')
source=("http://www.sz3dp.com/upfile/2016/11/18/20161118151949_653.deb")
md5sums=('ad56a54c313ed04e3e986a5fbf77fc87')

package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
}
