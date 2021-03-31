# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_files
pkgname=obs-service-$_servicename
pkgver=0.7.1
pkgrel=1
pkgdesc="An OBS source service: download files"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('50ac6566df51db34697ddeb8523a0bdda06fde35d77cd7c1c81eb6c903ab68fdace47ea19b24497e09bab2c58579c1b149223fc9ac0243a2c09e6ad8b29b70e2')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
