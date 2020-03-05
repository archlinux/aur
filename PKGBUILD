# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.19
pkgrel=1
pkgdesc="An OBS source service: running all the osc source-validator checks"
arch=('any')
url='https://github.com/openSUSE/obs-service-source_validator'
license=('GPL2')
depends=('libxml2' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-source_validator/archive/$pkgver.tar.gz")
sha512sums=('62f0d0ec870282240c2ebc0a9db8f9020e5229a00e1fb8baa592c2082d95ae3786abf2c5919b8990f8c52d961989948af501dbae0a2821eaeb7b0b70b7fc41b2')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
