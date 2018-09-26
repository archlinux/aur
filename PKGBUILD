# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_files
pkgname=obs-service-$_servicename
pkgver=0.6.2
pkgrel=1
pkgdesc="An OBS source service: download files"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('62a19f11769106ab3da8c811c41a17865c74ded1bbba839c391f43313ee2dc8ad3bef5d07a98fb69d681f4fe8936344f0d7025b09f59d3adb588093f10c2ca58')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
