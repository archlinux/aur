# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=26.0.2323370
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=25.2.2282810')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=('manual://RenderManForHoudini-26.0_2323370-linuxRHEL7_gcc93icx232.x86_64.rpm')
b2sums=('d6aa20055d5f2e2bfd37851f3e0511ee71f3374125d94f81c244701b025e9983689de85dd3fb51d30c03aae78d67860094d9f9919f59245796b3ca8636e7bc50')

package() {
    mv opt "$pkgdir/"
}
