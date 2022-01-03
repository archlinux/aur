# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-uritools
pkgver=4.0.0
pkgrel=1
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/tkem/uritools/archive/v${pkgver}.tar.gz")
sha256sums=('234d428d606b0cd9633bd0ee53f7c8450aec9240e456b677d1dff833e755066b')

package() {
    cd "$srcdir/uritools-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
