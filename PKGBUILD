# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 

pkgname=python-ilorest-library
_pkgname=ilorest-library
pkgver=6.2.0.0
pkgrel=3
pkgdesc="The python-ilorest-library is a python library built for interacting with the Redfish API remotely to any BMC that implements a Redfish API or any HPE system locally."
arch=(x86_64)
url="https://github.com/HewlettPackard/python-ilorest-library/"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3' 'python-jsonpath-rw' 'python-jsonpatch' 'python-jsonpointer' 'python-six')
makedepends=("python-pip")
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-ilorest-library/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('3cdf9af1fc99f203faf001be02f7a4e9eb77f685ec46a8c6e24d1fd74bfe713e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
