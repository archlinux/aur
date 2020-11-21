# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_url
pkgname=obs-service-$_servicename
pkgver=0.1.3
pkgrel=1
pkgdesc="An OBS source service: download URL"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
source=("https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('b2cf5b7d3fa2c67635833274956a89543acaf6d896e27a67d2e770d9dbb1014ec056dbfef60a2fce2b41f3e50faff978080ae108b36984e4e4224c89413ebdd0')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
}
