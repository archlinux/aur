# Maintainer: robertfoster

_pkgname=indy_crypto
pkgname=python-${_pkgname}
pkgver=0.4.2
pkgrel=1
pkgdesc="Official wrapper for Hyperledger Indy Crypto library"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('libindy-crypto')
makedepends=('python')
source=("https://github.com/hyperledger/indy-crypto/archive/v$pkgver.tar.gz") 

package() {
  cd $srcdir/indy-crypto-master
  cd wrappers/python
  python setup.py install -O1 --root="$pkgdir"
}

md5sums=('4d7aa0b77b7aea88f92fde5d01017afe')
