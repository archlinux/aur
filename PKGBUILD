# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-geosite
pkgver=20231208065009
pkgrel=1

pkgdesc='sing-geosite database'
arch=('any')
_repo="SagerNet/${pkgname}"
url="https://github.com/${_repo}"
license=('GPL3')

source=("${pkgver}.geosite.db::${url}/releases/download/${pkgver}/geosite.db"
        "${pkgver}.LICENSE::https://raw.githubusercontent.com/${_repo}/${pkgver}/LICENSE")
sha256sums=('f73bd08b9c799915f223f1cfb7c9af2288a7475c57672cffcef2df67bcdcb80c'
            '2f02b7486bcfa90d115c71a20437f3906b6fd5bef81c5dc0efd341399e89d0fd')

package() {
    install -Dm644 "${pkgver}.geosite.db" "${pkgdir}/usr/share/${pkgname}/geosite.db"
    install -Dm644 "${pkgver}.LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
