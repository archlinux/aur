# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=pyfetch
pkgver=2020.11.09
pkgrel=1
pkgdesc='neofetch rewritten in python'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('gtk3' 'python-gputil')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver-$pkgrel"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin"
}
