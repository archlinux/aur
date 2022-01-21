# Maintainer: Silas Groh <rubixdev@mailfence.com>

pkgname=eztex
pkgver=0.1.4
pkgrel=1
pkgdesc="A CLI tool for quickly starting new LaTeX projects"
arch=('any')
url="https://github.com/RubixDev/$pkgname"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fabdaf29a26219fd23bf5ba1a4aa9e5bc7e07794e6faa960868409ee88d360ad')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/eztex.sh" "$pkgdir/usr/bin/eztex"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/templates" "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
