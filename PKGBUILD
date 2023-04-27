# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=otf-cjk-standards-logo-font
pkgver=1.0
pkgrel=2
pkgdesc="Logos for standards used in Unicode CJK"
arch=(any)
url='https://github.com/NightFurySL2001/cjk-standards-logo'
license=(custom:CC0-1.0)
depends=()
makedepends=()
source=("CJKStandardLogos.otf::${url}/raw/main/CJKStandardLogos.otf"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('34a561fd82940782d509f51226e72935f2b6be890ec16ad7ad2832036d8e28c0'
            '36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673')
package() {
    install -Dm444 "${srcdir}/CJKStandardLogos.otf" -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}