# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=26.1.2324948
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-26.1_2324948-linuxRHEL7_gcc93icx232.x86_64.rpm')
b2sums=('bcdcf0d1ec89e7238e6f6d6b149e28161d4175167e0d00b40643c2e9ba6be8c7512c1dd2a4591bb55b103e44e29b53f6ce45252beacc53cda89d7d26ab2391ae')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
