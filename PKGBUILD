# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.18
pkgrel=2
pkgdesc="An OBS source service: running all the osc source-validator checks"
arch=('any')
url='https://github.com/openSUSE/obs-service-source_validator'
license=('GPL2')
depends=('libxml2' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-source_validator/archive/$pkgver.tar.gz")
sha512sums=('058d8e3adb229bbbbdc8f2a87cdca0774ee15ebc711e119334ecb7df16c708c4f0abc5f6a0de559bd45910447543c793a05767ff64cda855a9ad674b4b1e834c')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
