# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>
# Contributors: cyrevolt, seletskiy

pkgname=terminal_markdown_viewer
pkgver=1.6.3
pkgrel=1
pkgdesc="styled terminal markdown viewer"
url="https://github.com/axiros/terminal_markdown_viewer"
arch=('any')
license=('BSD')
depends=(python2 python2-docopt python2-markdown python2-pygments python2-yaml)
makedepends=(python2-setuptools)
source=(
  "https://github.com/axiros/terminal_markdown_viewer/archive/$pkgver.tar.gz"
)
sha512sums=('fdf79d4c67c5fe4b367397d9fa4d6559ff18671fc7cd88c1815b4acaf257afd5b088a37c3a09665439170dc89ce03f894b1416a28f1406591356d5d50c5eb5b9')

package() {
  cd "$srcdir/terminal_markdown_viewer-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}