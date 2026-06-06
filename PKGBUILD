pkgname=ldash-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/md-weber/ldash"
license=('GPL-3.0-or-later')
provides=('ldash')
conflicts=('ldash')

source_x86_64=("ldash-${pkgver}-x86_64.tar.gz::https://codeberg.org/md-weber/ldash/releases/download/v${pkgver}/ldash-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ldash-${pkgver}-aarch64.tar.gz::https://codeberg.org/md-weber/ldash/releases/download/v${pkgver}/ldash-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('1b07f8e890830e3cb5119bfbee32d0d9ff9ecc732ff6696175a1f87a8a0029ad')
sha256sums_aarch64=('f3a1de4ef94502cbb2c56b9dc4ced5146d0c6b2bc18e2f684a12f717fe8b85a7')

package() {
  install -Dm755 ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
