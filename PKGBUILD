# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=26.3.2352291
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=26.3.2352291')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-26.3_2352291-linuxRHEL9_gcc11icx232.x86_64.rpm')
b2sums=('c52e8bf21b6346b1f073bc0143645fdbc450d29ae049000a88fc8f017315ab5ccd8a28a19c767895fc6f0bb8ad83d3985e46665a30592957747a18d27551fd9b')

options=(!strip)

package() {
    mv opt "$pkgdir/"
}
