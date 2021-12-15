# Maintainer: GI Jack <gi_jack@hackermail.com>

pkgname=python-blue-loader
pkgver=0.1.41
pkgrel=1
pkgdesc="Python tools to communicate with Ledger Blue, Nano S and Nano X"
arch=('any')
url="https://github.com/LedgerHQ/blue-loader-python"
license=('Apache')
# missing: python-u2flib-host
depends=('python' 'python-hidapi' 'python-protobuf' 'python-pycryptodomex'
         'python-future' 'python-pillow' 'python-websocket-client' 'python-u2flib-host'
         'python-ecpy')
makedepends=('python-setuptools')
checkdepends=()
optdepends=('python-pyscard: smartcard')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LedgerHQ/blue-loader-python/archive/${pkgver}.tar.gz")
sha256sums=('11ec087dacaea54415760b26839fc38d4f972477fd82ecdee45635a580e8b56a')

package() {
  cd blue-loader-python-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
