# Maintainer: Eliza Emilia Semeniuk <sech1p@disroot.org>

pkgname=blahaj-cli
_pkgname=Blahaj
pkgver=0.3.0
pkgrel=1
pkgdesc="🦈 Beloved shark now in your Terminal!"
arch=('x86_64')
url='https://github.com/sech1p/blahaj'
license=('Apache-2.0')
options=(!strip)
depends=('nodejs' 'viu')
source=("https://github.com/sech1p/blahaj/releases/download/$pkgver/blahaj-linux-x64")
sha512sums=('1c59d56d49eff9155e08d5fc7ba6e488b03e3b5486c6928ff6e9b8404ed1f6ed66f5bce2ee5cd5774c2193bd8aa93203ece29261c93aa225935de4009269db48')

package() {
  install -Dm755 "$srcdir/blahaj-linux-x64" "$pkgdir/usr/bin/blahaj"
}
