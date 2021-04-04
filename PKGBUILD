# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=notekeeper
_pkgname=note-keeper
_script=note.bash
pkgver=1.0
pkgrel=1
pkgdesc='A tiny bash script for taking and organizing simple text notes.'
arch=('any')
url="https://github.com/dcchambers/note-keeper"
license=('MIT')
depends=('bash')
provides=('note')
source=("${url}/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('81aa3376f014e25b41030f5070171d9a1b86361f94a2c74ac1989e49a1824866')

package() {
  cd "$_pkgname"
  install -Dm755 ${_script} "$pkgdir"/usr/bin/note
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
