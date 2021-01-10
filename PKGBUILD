# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu-extra
pkgver=2021.01.10
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('CC BY-NC-SA 4.0')
depends=('autorandr' 'instamenu' 'instamenu-schemas')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('674ac027c70213c5242ab779257c9545aeb91f5d65d1ef1ade4c357b6ad3dbb7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
