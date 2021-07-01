# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>
# Contributors: cyrevolt, seletskiy

commitsha="80f333ba51dc2f1dfa854e203d3374a112aecbd3"

pkgname=terminal_markdown_viewer
pkgver=2.0.2
pkgrel=1
pkgdesc="styled terminal markdown viewer"
url="https://github.com/WillNye/terminal_markdown_viewer"
arch=('any')
license=('BSD')
depends=(python3 python-docopt python-markdown python-pygments python-yaml python-tabulate)
makedepends=(python-setuptools)
source=(
#  "https://github.com/WillNye/terminal_markdown_viewer/$pkgver.tar.gz"
  "https://github.com/WillNye/terminal_markdown_viewer/archive/refs/tags/$pkgver.tar.gz"
)
sha512sums=('ca04cef2833e79a3dd48f2a5b51d7e9d8b53ae2696d6a248ada79f2845a064973d4efac6d32ef92ea200f0b20714c8236b92e68b0b500a9ed50117b8b4c2e8cd')

package() {
  cd "$srcdir/terminal_markdown_viewer-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
