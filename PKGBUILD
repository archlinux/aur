# Maintainer: David Barri <japgolly@gmail.com>
pkgname=tla2json
pkgver=1.0.1
pkgrel=3
pkgdesc="Convert TLA+ output and values into JSON."
arch=('x86_64')
url="https://github.com/japgolly/tla2json"
license=('Apache')
depends=('java-runtime')
noextract=("tla2json-$pkgver.jar")
source=(
  "https://github.com/japgolly/tla2json/releases/download/v$pkgver/tla2json-$pkgver.jar"
  tla2json
)
sha256sums=('81a9d2928b2af0f389f2390bd10a47ac21b8235c130ee011a5d964450d017abf'
            'be4a88d33ab6f20c09270b22830b08f37fd059e888b9c272f0fe6c088337e92f')

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
  install -m644 tla2json-$pkgver.jar "$pkgdir/usr/share/java/tla2json.jar"
  install -m755 tla2json             "$pkgdir/usr/bin"
}
