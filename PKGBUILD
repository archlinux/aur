# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=typiskt
pkgver=2020.07.03.8
pkgrel=4
pkgdesc='touchtype training in the terminal'
arch=('any')
url='https://github.com/budlabs/typiskt'
license=('BSD')
groups=()
depends=('bc' 'gawk' 'util-linux')
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
sha256sums=('5de1a0e4230e26673118b5c0e4fa0a440704812448d2a9951c36571589bb2b3f')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
