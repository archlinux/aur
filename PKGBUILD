# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 

pkgname=python-ilorest-library
_pkgname=ilorest-library
pkgver=6.0.0.0
pkgrel=1
pkgdesc="The python-ilorest-library is a python library built for interacting with the Redfish API remotely to any BMC that implements a Redfish API or any HPE system locally."
arch=(x86_64)
url="https://github.com/HewlettPackard/python-ilorest-library/"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip")
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-ilorest-library/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('3362b8601052735a8e0a2522083dbc29559eb0cd64cd697981379d3ba9a81033')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
