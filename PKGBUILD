# Maintainer: Vin Fehring <vinfehring at gmail dot com>
# Contributor: Diogo Alexandre <diogo464 at d464 dot sh>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Luís Ferreira <net dot lsferreira at contact, backwards>

pkgname=railwayapp-cli
pkgver=4.40.2
pkgrel=1
pkgdesc="Command Line Interface for Railway.app"
arch=('x86_64')
url='https://github.com/railwayapp/cli'
license=('MIT')
depends=('gcc-libs')
source=("railway-v$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/railway-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/railwayapp/cli/v$pkgver/LICENSE")
sha256sums=('SKIP'
  'SKIP')

package() {
  install -Dv "$srcdir/railway" -t "$pkgdir/usr/bin/"
  install -Dvm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
