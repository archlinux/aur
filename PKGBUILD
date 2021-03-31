# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.21
pkgrel=1
pkgdesc="An OBS source service: running all the osc source-validator checks"
arch=('any')
url='https://github.com/openSUSE/obs-service-source_validator'
license=('GPL2')
depends=('libxml2' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-source_validator/archive/$pkgver.tar.gz")
sha512sums=('7299f3bf0a4cea748388372d25b74a32eafb700d2e13257733b2a406cb0bd18dd3283c57c1ee70374928365ba54b7cb4af58e0446bda6238df6042d8f94b223a')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
