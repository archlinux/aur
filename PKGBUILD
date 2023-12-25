# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=25.2.2282810
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=25.2.2282810')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-25.2_2282810-linuxRHEL7_gcc93icc219.x86_64.rpm')
sha256sums=('c81df25c27d24d2dd95b79ae2b820b13b0b1be632b65057bab55d88927a896ea')

package() {
    mv opt "$pkgdir/"
}
