# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=ducount
pkgver=1.2.0
pkgrel=1
pkgdesc="Calculates disk usage for files in a given directory"
url="https://github.com/simon-thorpe/ducount"
license=('BSD')
arch=('any')
depends=('python' 'python-termcolor')
source=("https://cdn.rawgit.com/simon-thorpe/ducount/v$pkgver/ducount")
sha256sums=('473675c80e50ee9b7a6ec95425059ad22891b97cfa98afc2245ef1c1dc3bb70c')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/ducount"
}
