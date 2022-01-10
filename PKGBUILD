# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=24.3.2208291
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-24.3_2208291-linuxRHEL7_gcc63icc190.x86_64.rpm')
sha256sums=('35134a22ef63588ddc6387ee108378d380fbf59330f770b7323ccfa6bbbdf7c8')

package() {
    mv opt $pkgdir/
}
