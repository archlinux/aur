# Contributor: Antti Hautaniemi <an7oine at me dot com>

pkgname=aceget
pkgver=1.2
pkgrel=1
pkgdesc="command-line ACE Stream client"
arch=('any')
url="http://acestream.org/"
license=('GPL')
depends=('expect' 'tcllib' 'curl')
optdepends=('acestream-engine: run the engine locally')
source=('aceget.exp')
sha256sums=('0f8ffc8699b4874bec7dc1afa02d2cc8f04bbc909eb8ebabbe3e9073cf26a905')

package() {
  install -D -m 755 "$srcdir/aceget.exp" "$pkgdir/usr/bin/aceget.exp"
}
