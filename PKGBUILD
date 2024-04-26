# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=26.1.2324948
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.1.2324948')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-26.1_2324948-linuxRHEL7_gcc93icx232.x86_64.rpm')
b2sums=('f2672743b3d2d05a93ce6d46b310f69881feaa971a3d2131d4ff750881e6e0eede5b11250da1916b0b74204ae4e795d9ead47c9ac5eb05305a44ff6389882bf2')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
