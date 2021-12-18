# Maintainer: Silas Groh <rubixdev@mailfence.com>

pkgname=eztex
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI tool for quickly starting new LaTeX projects"
arch=('any')
url="https://github.com/RubixDev/$pkgname"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('54d19a1db36c60b10c7c0e5458d08fcc2d883f7f0d423a6d69d68fc318bf42bb')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/eztex.sh" "$pkgdir/usr/bin/eztex"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/templates" "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
