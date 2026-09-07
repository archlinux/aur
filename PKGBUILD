pkgname=ldash-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Terminal dashboard TUI for hledger — crypto portfolio, net worth, monthly income/expenses"
arch=('x86_64' 'aarch64')
url="https://github.com/md-weber/ldash"
license=('GPL-3.0-or-later')
depends=('hledger')
provides=('ldash')
conflicts=('ldash')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/md-weber/ldash/releases/download/v$pkgver/ldash-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/md-weber/ldash/releases/download/v$pkgver/ldash-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('b1f30a1712088880c540b66262ab06b55392786466d49458026c42bf7b73941f')
sha256sums_aarch64=('3cdf5f177959f3d39a5f54bd0b3dcfb9c6be6b407515e54771f0be1ad7474a5f')

package() {
  install -Dm755 ldash "$pkgdir/usr/bin/ldash"
  install -Dm644 ldash.1 "$pkgdir/usr/share/man/man1/ldash.1"
}
