# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=linklord
pkgver=2020.01.08.20
pkgrel=4
pkgdesc='budlabs markdown flavored link manager'
arch=('any')
url='https://github.com/budlabs/linklord'
license=('BSD')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('d1af38a060400aaa583eafd6e44ecb9228cff7356226a07cfe14044ca6d588c4')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
