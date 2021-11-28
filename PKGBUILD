# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=24.2.2199188
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman=24.2.2199188')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-24.2_2199188-linuxRHEL7_gcc63icc190.x86_64.rpm')
sha256sums=('3421d4e132a8903e4e0ed7f78d3074a68d1d36c6507bb077ec78b4549285b926')

package() {
    mv opt $pkgdir/
}
