# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=notekeeper
_pkgname=note-keeper
_script=note.bash
pkgver=1.1
pkgrel=2
pkgdesc='A tiny bash script for taking and organizing simple text notes.'
arch=('any')
url="https://github.com/dcchambers/note-keeper"
license=('MIT')
depends=('bash')
provides=('note')
source=("${url}/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('6454637dcc985bbaebae4ac7c0fb35b6b057f796b67439fa89bb6c4d7b4c26e5')

package() {
  install -Dm755 ${_script} "$pkgdir"/usr/bin/note
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
