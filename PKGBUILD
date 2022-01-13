# Maintainer: Silas Groh <rubixdev@mailfence.com>

pkgname=eztex
pkgver=0.1.3
pkgrel=1
pkgdesc="A CLI tool for quickly starting new LaTeX projects"
arch=('any')
url="https://github.com/RubixDev/$pkgname"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('32db5deb5a928558afa517496ce3bcc1795d462eb91c1a6a1c8c65c7ff2f6956')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/eztex.sh" "$pkgdir/usr/bin/eztex"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/templates" "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
