# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=rmtrash
pkgver=1.15
pkgrel=2
pkgdesc="trash-put made compatible with GNU's rm and rmdir"
url='https://github.com/PhrozenByte/rmtrash'
license=('GPL-3.0-only')
arch=('any')
depends=('trash-cli')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e238f24fe22a5fc6f35e137b000cb943b72debf2d02bd06a2c851804c6b15e4b')

package() {
  cd rmtrash-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/rmtrash"
  install -Dm755 rmtrash -t "$pkgdir/usr/bin"
  install -Dm755 rmdirtrash -t "$pkgdir/usr/bin"
}
