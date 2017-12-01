# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=pac
pkgver=1.3.7
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
sha256sums=('fa09bd68805a3a0f967f2e6ed567e5659bbf359e5ea57a97fdd4f60e0e22a07c'
            'SKIP')

package() {
    install -dm 755 "$pkgdir"/usr/bin/
    install -m 755 "pac-${pkgver}/pac" "$pkgdir"/usr/bin/
}
