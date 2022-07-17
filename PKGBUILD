# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_files
pkgname=obs-service-$_servicename
pkgver=0.9.1
pkgrel=1
pkgdesc="An OBS source service: download files"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('a368b031c052b2ca7171559c44d23035d02dd288743920732fdc90009961da99cd1866ad084fc13096b66beca5323930194486cae3ecdfe96b07dba4cc29565b')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
