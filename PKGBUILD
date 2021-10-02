# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-uritools
pkgver=3.0.2
pkgrel=2
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/tkem/uritools/archive/v${pkgver}.tar.gz")
sha256sums=('4f38ec758a08965558b517bb4a5a2e3473faa591d6d355f738bb84cfa4a8da22')

package() {
    cd "$srcdir/uritools-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
