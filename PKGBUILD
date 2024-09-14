# Maintainer: Eliza Emilia Semeniuk <sech1p@disroot.org>

pkgname=blahaj-cli
_pkgname=Blahaj
pkgver=0.2.3
pkgrel=1
pkgdesc="🦈 Beloved shark now in your Terminal!"
arch=('x86_64')
url='https://github.com/sech1p/blahaj'
license=('Apache-2.0')
options=(!strip)
depends=('nodejs' 'viu')
source=("https://github.com/sech1p/blahaj/releases/download/$pkgver/blahaj-linux-x64")
sha512sums=('807ea956940206c7612bb2ea7cf591a3df9eda57014890d16b8c5b9e7f0b695380a029aa02dd9edaf4fe55eef1b07d3a39b0691237b80ef5838586c051be622d')

package() {
  install -Dm755 "$srcdir/blahaj-linux-x64" "$pkgdir/usr/bin/blahaj"
}
