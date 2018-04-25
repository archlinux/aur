# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
pkgname=zbase32
pkgver=1.1.5
pkgrel=2
pkgdesc="An alternate base32 encoder (not RFC 3548 compliant)"
arch=('any')
url='https://pypi.python.org/pypi/zbase32'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/da/86/d121236fc2d7f287dac1ef99e5452df36852a609bda6b9225f9aa2078139/zbase32-${pkgver}.tar.gz")
sha256sums=('9b25c34ba586cbbad4517af516e723599a6f38fc560f4797855a5f3051e6422f')

build() {
    cd "$srcdir/zbase32-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/zbase32-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
