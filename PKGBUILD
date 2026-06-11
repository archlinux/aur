pkgname=ldash-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/md-weber/ldash"
license=('GPL-3.0-or-later')
provides=('ldash')
conflicts=('ldash')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://codeberg.org/md-weber/ldash/releases/download/v$pkgver/ldash-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://codeberg.org/md-weber/ldash/releases/download/v$pkgver/ldash-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('8a8273d64db31e7aa5782549533e65d692e6487febb3c639b823519243ef8e84')
sha256sums_aarch64=('c7cfdb523515507066e3c7ff303f88b1a5a0f8366064767a505fec738c7b182e')

package() {
  install -Dm755 ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
