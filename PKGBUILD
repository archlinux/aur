# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=24.4.2226589
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-24.4_2226589-linuxRHEL7_gcc63icc190.x86_64.rpm')
sha256sums=('f2793b2f688b57c5c8cbe9fc66542a17432cebf93a4a9251cadd7731fbc66d42')

package() {
    mv opt $pkgdir/
}
