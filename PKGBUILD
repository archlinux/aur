# Maintainer:  Rachid Zarouali <xinity77@gmail.com>

pkgname=duffle-bin
pkgver=0.1.0
pkgsubver=-ralpha.4+dramallamabuie
pkgrel=1
pkgdesc="CNAB installer"
url="https://github.com/deislabs/duffle"
arch=('x86_64')
license=('MIT')
options=(!strip)
source=(
  "duffle-$pkgver::https://github.com/deislabs/duffle/releases/download/$pkgver$pkgsubver/duffle-linux-amd64"
)

sha256sums=('68103b1225335803b460031d5ba16b15adae87aed11bfa73f1372554448d5aaa')

package() {
  cd "$srcdir"
  install -Dm755 "duffle-$pkgver" "$pkgdir/usr/bin/duffle"
}

# vim:set ts=2 sw=2 et: