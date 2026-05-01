# Maintainer: simatsan186@gmail.com
pkgname=otf-monocraft-font
pkgver=4.2.1
pkgrel=1
pkgdesc="A monospaced programming font inspired by the Minecraft typeface (binary version)"
arch=('any')
url="https://github.com/IdreesInc/Monocraft"
license=('OFL-1.1')
provides=('otf-monocraft')
conflicts=('otf-monocraft')
source=("${pkgname}-${pkgver}.ttc::${url}/releases/download/v${pkgver}/Monocraft.ttc")
sha256sums=('0ea1aea12f03d552a469fc017f19ea927b53bf9d21e60a41c5c476c3faf3c7f9')

package() {
    install -Dm644 "${pkgname}-${pkgver}.ttc" "${pkgdir}/usr/share/fonts/OTF/Monocraft.ttc"
    
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
