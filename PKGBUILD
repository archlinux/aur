# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 

pkgname=python-ilorest-library
_pkgname=ilorest-library
pkgver=7.3.0.0
pkgrel=1
pkgdesc="The python-ilorest-library is a python library built for interacting with the Redfish API remotely to any BMC that implements a Redfish API or any HPE system locally."
arch=(x86_64)
url="https://github.com/HewlettPackard/python-ilorest-library/"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3' 'python-jsonpath-rw' 'python-jsonpatch' 'python-jsonpointer' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel')
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-ilorest-library/releases/download/v${pkgver}/python_ilorest_library-${pkgver}.tar.gz")
sha256sums=('3ab0104ea793f6f71c966bf6d99356118232745053c1cfa074d2190095fdfe6f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
