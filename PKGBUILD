# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>

pkgname=matrix.sh
epoch=1
pkgver=1.4
pkgrel=1
pkgdesc='Bash script to send messages to a matrix chat.'
arch=('x86_64')
url='https://github.com/fabianonline/matrix.sh'
license=('GPL3')
depends=()
makedepends=()
source=("matrix.sh::https://raw.githubusercontent.com/fabianonline/matrix.sh/master/matrix.sh")
sha256sums=('9307d677ece2c82bceb59cf33d1edc18024b512b6f5458e63a7b57e3710ad5ef')
options=()

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/matrix.sh" "$pkgdir/usr/bin/matrix.sh"
    chmod +x "$pkgdir/usr/bin/matrix.sh"
}
