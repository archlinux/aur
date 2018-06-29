# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_servicename=download_files
pkgname=obs-service-$_servicename
pkgver=0.6.1
pkgrel=1
pkgdesc="An OBS source service: download files"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
depends=('bash')
source=("https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('b7adc86a1c136b6a9a59f29b300b9b1b8945347cebed00732143ba9909b900903f606d077c7e866281fa04be79fceae486aa536d6a14dc10934a74274fd104af')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
