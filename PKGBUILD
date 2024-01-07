# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=pascha-gui-bin
pkgver=1.0
pkgrel=1

pkgdesc="A simple GUI program to calculate and display the date of Pascha (Easter)"
arch=('any')
url="https://gitlab.com/cmmescher/pascha-gui.git"
license=('GPL3')
depends=('gtk3' 'sdl2' 'libmspack')
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/cmmescher/pascha-gui/releases/download/v1.0/pascha-gui-v1-0.gz")
md5sums=('9296598391fb34b6c847fb05601dcc3c')
sha256sums=('701234617b7d917ecaa08f8cf581d455b1a2efaf5b20a6f9760cb2b0ad241daf')

package() {
    install -Dm0755 "$srcdir/pascha-gui-v1-0" "$pkgdir/usr/bin/pascha-gui"
}
