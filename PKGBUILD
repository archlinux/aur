# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_url
pkgname=obs-service-$_servicename
pkgver=0.1.2
pkgrel=1
pkgdesc="An OBS source service: download URL"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
source=("https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('a6de2a52577674e7141b66c24467a7d42a20d85aba186f5c8cfeb8d21d805974236dd4f6278174cc7e0ddd552bb3b15e7f6d789a66aa1d96977ae2c90ad15bca')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
}
