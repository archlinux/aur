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
sha256sums=('2c89471b6d32632b6ea438794aed89cbd92614f091aefa42269f7f0073048fff')

package() {
  install -Dm755 "$srcdir/pingstat" "$pkgdir/usr/bin/pingstat"
}
