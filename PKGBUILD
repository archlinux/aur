# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=26.0.2323370
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-26.0_2323370-linuxRHEL7_gcc93icx232.x86_64.rpm')
b2sums=('3fe16979d95cc51ae59f47037d215640a14feb7a1c1c877a2e2ae35ef75539edf9df61e6799cb9715bbc5e938562e1946e6e995c1fbdf77fd1857f68769565d0')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
