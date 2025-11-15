# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=27.0.2386582
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=27.0.2386582')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-27.0_2386582-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('633fa643e7c074c66da5ddd858ac1d9c17942ccd064087312aec91f8fe6a6538010a735e3c94d8b49827f46fd6795226e4e7c618f34dc9e3f124174b27c8abad')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
