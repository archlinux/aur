# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_files
pkgname=obs-service-$_servicename
pkgver=0.9.2
pkgrel=1
pkgdesc="An OBS source service: download files"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('1e93a1d175af3570e1dbda45069d9f368bd22a42b297b236035e53d600022c032a353cb30c79636aaf8ee5dfa21d3792b1f2c7a9090ff1599ff91fd9df5deb29')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
