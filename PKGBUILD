# Maintainer: Florian Reinhard <f.reinhard42@gmail.com>
# Updater: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.14.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
license=()
groups=()
depends=('qt5-base')
source=("http://www.sz3dp.com/upfile/2017/01/03/20170103151442_199.deb")
md5sums=('8ec17f5d22f2296ebc2cb7fd30d77332')

package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
}
