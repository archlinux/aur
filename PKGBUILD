# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 

pkgname=python-ilorest-library
_pkgname=ilorest-library
pkgver=7.1.0.0
pkgrel=1
pkgdesc="The python-ilorest-library is a python library built for interacting with the Redfish API remotely to any BMC that implements a Redfish API or any HPE system locally."
arch=(x86_64)
url="https://github.com/HewlettPackard/python-ilorest-library/"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3' 'python-jsonpath-rw' 'python-jsonpatch' 'python-jsonpointer' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel')
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-ilorest-library/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('4b11193edd3269f24ee76568887e29904d11afd4ecc897c81090252e556f5c03')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
