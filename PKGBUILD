# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-uritools
pkgver=3.0.0
pkgrel=1
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/tkem/uritools/archive/v${pkgver}.tar.gz")
md5sums=('c8ede672582d12d2516dad90267dd7c7')

package() {
    cd "$srcdir/uritools-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
