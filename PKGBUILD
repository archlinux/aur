# Maintainer: robertfoster

_pkgname=indy_crypto
pkgname=python-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="Official wrapper for Hyperledger Indy Crypto library"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('libindy-crypto')
makedepends=('python')
source=("https://github.com/hyperledger/indy-sdk/archive/v$pkgver.tar.gz")

package() {
  cd $srcdir/indy-sdk-$pkgver
  cd wrappers/python
  python setup.py install -O1 --root="$pkgdir"
}

md5sums=('12651e3b3ce57669d22a3a70340a42fc')
