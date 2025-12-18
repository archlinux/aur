# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=27.1.2389102
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=27.1.2389102')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-27.1_2389102-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('a7ba18743ac84061f0c11a973622c826e8d1502a784856eb568bb9ecaea48cfccd1f7f7851c8ae3d7be27fb52cca18f145ed439a7ba18547a547ca4a2fb1d256')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
