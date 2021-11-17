# Maintainer: -=De/\/=-
# Author: -=De/\/=-
pkgname=pyxenon
pkgver=0.1
pkgrel=15
pkgdesc="Pyxenon - xenon like game preview written in python"
arch=('x86_64')
url='https://games.os.vc'
license=('GPLv3')

source=("https://games.os.vc/pygames/${pkgname}-${pkgver}-${pkgrel}.tar.gz"
        "pyxenon.desktop")

package() {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/pyxenon
    install -d -m755 ${pkgdir}/usr/local/bin

    install -D -m644 pyxenon.desktop ${pkgdir}/usr/share/applications/pyxenon.desktop
    
    cp -r * ${pkgdir}/usr/local/games/pyxenon/
    install -D -m755  ${pkgdir}/usr/local/games/pyxenon/pyxenon ${pkgdir}/usr/local/bin/pyxenon
    rm -rf ${pkgdir}/usr/local/games/pyxenon/pyxenon*
}

sha256sums=('954a6ec3280f368ad8451b0d39522f61ebc822e2e500b3af9cb49693c1ced834'
            '6124c10735be364fa02c5dbcd33d1647e3a65119f7241151d3eba389033b9b21')
