# Maintainer: tomsh <tomsh@disroot.org>
pkgname=pingstat
pkgver=1.1.0
pkgrel=1
pkgdesc="A lightweight CLI for multi-server ping monitoring and statistics"
arch=('any')
url="https://codeberg.org/tomsh/pingstat"
license=('MIT')
depends=('bash' 'sqlite3' 'inetutils' 'coreutils')
makedepends=()
source=("https://codeberg.org/tomsh/pingstat/raw/tag/$pkgver/pingstat")
sha256sums=('3e541301236f588466064d45f06432b9e0b58ed79581f34fbd9ebec977adb7cf')

package() {
  install -Dm755 "$srcdir/pingstat" "$pkgdir/usr/bin/pingstat"
}
