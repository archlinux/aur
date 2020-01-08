# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=linklord
pkgver=2020.01.08.19
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
sha256sums=('0825e2364c19cb6cbaa838856a7f77c14ac7e647924663aa3f122065e4a56b79')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
