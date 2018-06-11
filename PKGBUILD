# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.3.10
pkgrel=2
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://gitlab.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0'
         'pacaur')
source=("https://gitlab.com/XenGi/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        "https://gitlab.com/XenGi/${pkgname}/uploads/83d5f9987c4123ae441498dfb04841f6/${pkgname}-v${pkgver}.tar.gz.sig")
validpgpkeys=('872CE014D895F3266E2354F91A9D657D06B5820E')  # Ricardo band
sha256sums=('81d2829da8bedb9a6bb94fb0a036cfe242a8713081787d39ad7ee413e481a2a9'
            'SKIP')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 "pac-${pkgver}/pac" "$pkgdir"/usr/bin/
}
