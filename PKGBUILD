# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=apple_cursor
pkgver=2.0.0
pkgrel=1
pkgdesc='Opensource macOS cursors'
arch=('any')
url='https://github.com/ful1e5/apple_cursor'
license=('GPL3')
depends=()
makedepends=()
source=("monterey.tar.gz::${url}/releases/download/v${pkgver}/macOS-Monterey.tar.gz"
        "monterey-white.tar.gz::${url}/releases/download/v${pkgver}/macOS-Monterey-White.tar.gz"
        "bigsur.tar.gz::${url}/releases/download/v${pkgver}/macOS-BigSur.tar.gz"
        "bigsur-white.tar.gz::${url}/releases/download/v${pkgver}/macOS-BigSur-White.tar.gz")
sha512sums=('c46f84840e17ea96767b7a1189c2825d93a796a4f8e20f952ad4e81257c16a50c688623dba50fa6c71cc3e79378d662e8a616fe767197ab195351957ac48e5d7'
            '06a0a9f1590b268759271f37f53389a51ee92cecc12c7dfea532ab2f81cb2ecfeee87fb8ce42868656f9a03fc100c7214525af256a7b2330b038ea8eb5e7d03d'
            'b00c9272e03bd974f2b945f657f340aa1f661ad881339daffb46a276e450674a12c75ba39596ea05e263b69df025467cc4aa50782ae0e7dad449a6764c8a5245'
            '50414afc5ecddbb383a0f8f959e4a2f99c33471046f156d9d87ac67ad7bdb1b97a321f04b3731942ce28540ed3945abdca48a8aeb08a468f2444d6e72b4e2896')

package() {
    install -d "${pkgdir}/usr/share/icons"

    cp -r "${srcdir}/macOS-Monterey" "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/macOS-Monterey-White" "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/macOS-BigSur" "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/macOS-BigSur-White" "${pkgdir}/usr/share/icons"
}
