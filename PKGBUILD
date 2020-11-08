# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=pyfetch
pkgver=2020.11.08
pkgrel=1
pkgdesc='neofetch rewritten in python'
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=('gtk3' 'python-gputil')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('9cdd9c9d7f24a38913d5942e395efc677ed6d3cdf281a4701b13b6da6d63c301')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "usr/bin/$pkgname" -t "$pkgdir/usr/bin"
}
