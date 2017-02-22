# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.3.0
pkgrel=2
epoch=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0'
         'pacaur')
source=("pac-${pkgver}.tar.gz::https://github.com/XenGi/pac/archive/v${pkgver}.tar.gz"
        "https://github.com/XenGi/pac/releases/download/v${pkgver}/pac-${pkgver}.tar.gz.sig")
validpgpkeys=('872CE014D895F3266E2354F91A9D657D06B5820E')  # Ricardo band
sha256sums=('e46c90a33c9399fec5682e12995e19a7db0ba1f0ffebfc87843320071db5675c'
            'SKIP')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 "pac-${pkgver}/pac" "$pkgdir"/usr/bin/
}
