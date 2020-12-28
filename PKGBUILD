# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu-extra 
pkgver=2020.12.28
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
depends=(instamenu)
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}