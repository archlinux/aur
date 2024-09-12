# Maintainer: Eliza Emilia Semeniuk <sech1p@disroot.org>

pkgname=blahaj-cli
_pkgname=Blahaj
pkgver=0.2.2
pkgrel=1
pkgdesc="🦈 Beloved shark now in your Terminal!"
arch=('x86_64')
url='https://discordapp.com'
license=('Apache-2.0')
options=(!strip)
depends=('nodejs' 'viu')
source=("https://github.com/sech1p/blahaj/releases/download/$pkgver/blahaj-linux-x64")
sha512sums=('6cca0c4f5571581d8d3aa11a57a2a838ca4abdb1479a872e187833b463c8fed3cbb2dff4c28522859a37d74c4919a5533aa358acc5637ab25736f41f1ae5b715')

package() {
  install -Dm755 "$srcdir/blahaj-linux-x64" "$pkgdir/usr/bin/blahaj"
}
