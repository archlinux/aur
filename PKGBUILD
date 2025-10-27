# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 

pkgname=python-ilorest-library
_pkgname=ilorest-library
pkgver=6.3.0.0
pkgrel=2
pkgdesc="The python-ilorest-library is a python library built for interacting with the Redfish API remotely to any BMC that implements a Redfish API or any HPE system locally."
arch=(x86_64)
url="https://github.com/HewlettPackard/python-ilorest-library/"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3' 'python-jsonpath-rw' 'python-jsonpatch' 'python-jsonpointer' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel')
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-ilorest-library/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('e150b633a693cda7ddf0f8297deefe33021960c058fc06c35b30d198e5803de0')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
