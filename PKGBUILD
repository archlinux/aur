# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=notekeeper
_pkgname=note-keeper
_script=note.bash
pkgver=1.3
pkgrel=1
pkgdesc='A tiny bash script for taking and organizing simple text notes.'
arch=('any')
url="https://github.com/dcchambers/note-keeper"
license=('MIT')
depends=('bash')
provides=('note')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7d5111c90c0c565f7608f9075cd7ebe51bd987eb388a2ea2cd8156cfa8b03571')

package() {
  install -Dm755 ${_script} "$pkgdir"/usr/bin/note
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
