# Maintainer: David Barri <japgolly@gmail.com>
pkgname=tla2json
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert TLA+ output and values into JSON."
arch=('x86_64')
url="https://github.com/japgolly/tla2json"
license=('Apache')
depends=('java-runtime')
noextract=('tla2json.jar')
source=(
  "https://github.com/japgolly/tla2json/releases/download/v$pkgver/tla2json.jar"
  tla2json
)
sha256sums=(
  '2054d7f60521fd6a8dc974b927d69a380ba867b000e3d71dc46fafd8c291c22d'
  'be4a88d33ab6f20c09270b22830b08f37fd059e888b9c272f0fe6c088337e92f'
)

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
  install -m644 tla2json.jar "$pkgdir/usr/share/java"
  install -m755 tla2json     "$pkgdir/usr/bin"
}
