# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-pro-server
pkgver=25.2.2282810
pkgrel=1
pkgdesc="Foundation for the RenderMan rendering pipeline"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
optdepends=('renderman: Downloader for the RPM package')

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM through the renderman package")
source=('manual://RenderManProServer-25.2_2282810-linuxRHEL7_gcc93icc219.x86_64.rpm')
sha256sums=('6b3acebe3d5efd0f8cc16b6c1722548e6d11c957441e9bc04185226fd16660d3')

package() {
    mv opt "$pkgdir/"
}
