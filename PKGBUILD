# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-uritools
pkgver=4.0.2
pkgrel=1
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/tkem/uritools/archive/v${pkgver}.tar.gz")
sha256sums=('3a48b48fb2e06cd6fa07e4a89e361ad9e26adf33716bc8637a38f8c8eec6181b')

package() {
    cd "$srcdir/uritools-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
