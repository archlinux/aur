# Maintainer: Tyrolyean <tyrolyean@tyrolyean.net>

pkgname=keepassxc-menu
pkgver=0.1.0
pkgrel=2
provides=("$pkgname")
pkgdesc="Sift through keepassxc database entries and autotype the password directly in the input form with a hotkey."
arch=('any')
url="https://github.com/Tyrolyean/$pkgname"
license=('GPL-3.0')
makedepends=()
optdepends=('keepassxc')
depends=('tcl' 'expect')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e80aaa2c18132bbdf07f5c574f8cde836ea6135383a8c3892d40c85aefdb2b20')
sha512sums=('2b61d8764d74c90d2065fdbc7e08457201bb07db1353daac87efa520c0f9d87dd4d95cfa57253d711a06990ece59ce0b860c6229a78faea65f9358405403cd45')

package() {
  cd "${srcdir}/"
  install -DTm0755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
