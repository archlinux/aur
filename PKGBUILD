# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 

pkgname=python-ilorest-library
_pkgname=ilorest-library
pkgver=5.3.0.0
pkgrel=3
pkgdesc="The python-ilorest-library is a python library built for interacting with the Redfish API remotely to any BMC that implements a Redfish API or any HPE system locally."
arch=(x86_64)
url="https://github.com/HewlettPackard/python-ilorest-library/"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip")
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-ilorest-library/releases/download/v${pkgver}a/${pkgname}-${pkgver}.zip")
sha256sums=('f58032ab3d32d7dde330cc160866a73e6d303cf2dbddddbe1fce9a0edc6b55a9')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
