# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>
# Contributors: cyrevolt, seletskiy

commitsha="80f333ba51dc2f1dfa854e203d3374a112aecbd3"

pkgname=terminal_markdown_viewer
pkgver=1.7.4
pkgrel=3
pkgdesc="styled terminal markdown viewer"
url="https://github.com/axiros/terminal_markdown_viewer"
arch=('any')
license=('BSD')
depends=(python3 python-docopt python-markdown python-pygments python-yaml python-tabulate)
makedepends=(python-setuptools)
source=(
#  "https://github.com/axiros/terminal_markdown_viewer/archive/$pkgver.tar.gz"
  "https://github.com/axiros/$pkgname/archive/$commitsha.tar.gz"
)
sha512sums=('bbd05e709f33bbe43841128e8aee5c723bde802cf6d933f15c206ebddeedf720b06fcb711b8c11029fef15f01e089c39e226beea67a07098c1bc13daf9abf462')

package() {
  cd "$srcdir/terminal_markdown_viewer-${commitsha}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}