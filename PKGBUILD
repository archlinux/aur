# Maintainer: Silas Groh <rubixdev@mailfence.com>

pkgname=eztex
pkgver=0.1.2
pkgrel=1
pkgdesc="A CLI tool for quickly starting new LaTeX projects"
arch=('any')
url="https://github.com/RubixDev/$pkgname"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('92cac83baff3527a63f7bf0bd0e5c8cf92d41be0ccaf1de3460de1b46f8fa3de')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/eztex.sh" "$pkgdir/usr/bin/eztex"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/templates" "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
