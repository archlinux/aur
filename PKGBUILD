# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=26.3.2351688
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.3.2351688')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-26.3_2351688-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('e4b3a3d910ab072943e7bbb4472977220cd715c0ea1513dd509c002d709a8cd16df40ffdbde741753c0b5e79b6e64abc1ddd7c524e2ddea9f9f2cd31acd909b7')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
