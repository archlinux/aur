# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miller-bin
pkgver=5.10.2
pkgrel=1
pkgdesc="awk, sed, cut, join, and sort for data formats such as CSV, TSV, tabular JSON and positionally-indexed"
arch=('x86_64')
url="https://miller.readthedocs.io"
license=('BSD')
depends=('glibc')
provides=('miller')
conflicts=('miller')
source=("LICENSE.txt::https://raw.githubusercontent.com/johnkerl/miller/main/LICENSE.txt")
source_x86_64=("https://github.com/johnkerl/miller/releases/download/v$pkgver/mlr.linux.x86_64")
sha256sums=('SKIP')
sha256sums_x86_64=('777dffb636ea1570672bdf05182020cff51ea25c31108417118186ea7bfac4a7')


package() {
  cd "$srcdir"

  install -Dm755 "mlr.linux.x86_64" "$pkgdir/usr/bin/mlr"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/miller"
}
