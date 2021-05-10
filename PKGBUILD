# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-uritools
pkgver=3.0.2
pkgrel=1
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/tkem/uritools/archive/v${pkgver}.tar.gz")
md5sums=('72cd2f4cd625869d4425acd19d62a614')

package() {
    cd "$srcdir/uritools-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
