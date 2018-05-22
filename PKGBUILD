# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.3.9
pkgrel=1
pkgdesc="Small wrapper around pacaur to mimic yaourts search feature"
arch=(any)
url="https://github.com/XenGi/pac"
license=('MIT')
depends=('python>=3.6.0'
         'pacaur')
source=("https://github.com/XenGi/pac/archive/v${pkgver}.tar.gz"
        "https://github.com/XenGi/pac/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig")
validpgpkeys=('872CE014D895F3266E2354F91A9D657D06B5820E')  # Ricardo band
sha256sums=('8de0e119db10854a8b8a68382130e058e5eed1663d949337790fc5e15baad22e'
            'SKIP')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 "pac-${pkgver}/pac" "$pkgdir"/usr/bin/
}
