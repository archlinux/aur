pkgname=ldash-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://github.com/md-weber/ldash"
license=('GPL-3.0-or-later')
provides=('ldash')
conflicts=('ldash')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/md-weber/ldash/releases/download/v$pkgver/ldash-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/md-weber/ldash/releases/download/v$pkgver/ldash-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('7336bd7612368be7e508db6733e8c066c25656a343deab6406384da6a2701817')
sha256sums_aarch64=('b16370754bc30ec8745d1c8220b3980699ab3ddaede23506e33fda44dd06a681')

package() {
  install -Dm755 ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
