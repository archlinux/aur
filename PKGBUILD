# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=26.2.2336968
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.2.2336968')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-26.2_2336968-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('f1a192715269f113b881e04c30d1918cda1877a44b8112add5487feff11772574365a78139b0a0c3bce8802488a2a24a2e5904a0eb3b2fcf9638c49dfdcbeeb2')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
