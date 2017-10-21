# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_url
pkgname=obs-service-$_servicename
pkgver=0.1.1
pkgrel=1
pkgdesc="An OBS source service: download URL"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=()
source=("https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('d79dbec6a1e89d6e2b0ff0cfb22b9f94e62358b5d913c8d2ef95f27c53f46fd911ee4e5e87ac493b3f439027dd6ac669035089787f7080755560349a3c8a1456')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
}
