# Contributor: Antti Hautaniemi <an7oine at me dot com>

pkgname=aceget
pkgver=1.1
pkgrel=1
pkgdesc="command-line ACE Stream client"
arch=('any')
url="http://acestream.org/"
license=('GPL')
depends=('expect' 'tcllib' 'curl')
optdepends=('acestream-engine: run the engine locally')
source=('aceget.exp')
sha256sums=('e8bc3c51b7ecde766a73bb294bfe33fc03e5f3e2151a5b1e0be4f0d01e706be6')

package() {
  install -D -m 755 "$srcdir/aceget.exp" "$pkgdir/usr/bin/aceget.exp"
}
