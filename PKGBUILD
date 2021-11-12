# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=notekeeper
_pkgname=note-keeper
_script=note.bash
pkgver=1.2
pkgrel=1
pkgdesc='A tiny bash script for taking and organizing simple text notes.'
arch=('any')
url="https://github.com/dcchambers/note-keeper"
license=('MIT')
depends=('bash')
provides=('note')
source=("${url}/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('5d2006b904d7bfae573019111d9f417087cd7956ce6f98353b5ceee1ad7344cb')

package() {
  install -Dm755 ${_script} "$pkgdir"/usr/bin/note
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
