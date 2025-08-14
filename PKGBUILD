# Maintainer: stabldev <thestabldev@gmail.com>

pkgname=aur-test-pkg
pkgver=1.0.0
pkgrel=1
pkgdesc="Empty test package"
arch=("any")
license=("MIT")
source=("https://github.githubassets.com/favicons/favicon.png")
sha256sums=('74cf90ac2fe6624ab1056cacea11cf7ed4f8bef54bbb0e869638013bba45bc08')

package() {
  install -Dm644 "$srcdir/favicon.png" "$pkgdir/usr/share/$pkgname/favicon.png"
}
