# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=otf-cjk-standards-logo-font
pkgver=1.0
pkgdesc="Logos for standards used in Unicode CJK"
pkgrel=1
arch=(any)
url='https://github.com/NightFurySL2001/cjk-standards-logo'
license=(CC0-1.0)
depends=()
makedepends=()
source=(
    "CJKStandardLogos.otf::${url}/raw/main/CJKStandardLogos.otf"
)
sha256sums=('34a561fd82940782d509f51226e72935f2b6be890ec16ad7ad2832036d8e28c0')
package() {
    install -dm755 "${pkgdir}/usr/share/fonts/OTF"
    cp "${srcdir}/CJKStandardLogos.otf" "${pkgdir}/usr/share/fonts/OTF"
}  
