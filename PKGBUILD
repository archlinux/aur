# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-uritools
pkgver=4.0.1
pkgrel=1
pkgdesc="RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse"
arch=('any')
url="https://pypi.python.org/pypi/uritools"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/tkem/uritools/archive/v${pkgver}.tar.gz")
sha256sums=('80970aea7c4b65500dd9d2363b073ab1c8be78d63affd7e9fcbe49b5f52b633d')

package() {
    cd "$srcdir/uritools-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
