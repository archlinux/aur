# Maintainer: robertfoster

_pkgname=indy
pkgname=python-${_pkgname}
pkgver=1.8.0
pkgrel=1
pkgdesc="Official wrapper for Hyperledger Indy library"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-sdk"
license=('APACHE')
depends=('libindy')
makedepends=('python')
source=("https://github.com/hyperledger/indy-sdk/archive/v$pkgver.tar.gz")

package() {
  cd $srcdir/indy-sdk-$pkgver
  cd wrappers/python
  python setup.py install -O1 --root="$pkgdir"
}

md5sums=('f8c7b78b097935691b019f45005bef6c')
