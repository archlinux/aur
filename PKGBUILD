# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.24
pkgrel=1
pkgdesc="An OBS source service: running all the osc source-validator checks"
arch=('any')
url='https://github.com/openSUSE/obs-service-source_validator'
license=('GPL2')
depends=('libxml2' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-source_validator/archive/$pkgver.tar.gz")
sha512sums=('1382cb889c3c0388e2d1f059d076bcf0b8b20a5d7c3b1673f2ad70b3cecb01b217ded8d81b2ed44495c97e3cf04ab6d68f28aaec9d2997735fa4b7564bef98db')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
