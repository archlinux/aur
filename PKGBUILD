# Contributor: Antti Hautaniemi <an7oine at me dot com>

pkgname=aceget
pkgver=1.0
pkgrel=1
pkgdesc="command-line ACE Stream client"
arch=('any')
url="http://acestream.org/"
license=('GPL')
depends=('expect' 'tcllib' 'curl')
optdepends=('acestream-engine: run the engine locally')
source=('aceget.exp')
sha256sums=('c424a05a0fd5fe8a66bd3570d4454810a5b73202d2ee9152644eaa736adddc35')

package() {
  install -D -m 755 "$srcdir/aceget.exp" "$pkgdir/usr/bin/aceget.exp"
}
