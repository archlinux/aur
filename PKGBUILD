# Maintainer: robertfoster

_pkgname=indy-anoncreds
pkgname=hyperledger-${_pkgname}
pkgver=1.0.11
pkgrel=1
pkgdesc="A python implementation of the anonymous credentials ideas developed by IBM Research"
arch=(i686 x86_64)
url="https://github.com/hyperledger/${_pkgname}"
license=('APACHE')
groups=('hyperledger-indy')
depends=('python')
makedepends=('python')
source=("https://github.com/hyperledger/${_pkgname}/archive/$pkgver-stable.tar.gz")

package() {
  cd $srcdir/${_pkgname}-$pkgver-stable
  python setup.py install -O1 --root="$pkgdir"
}

md5sums=('107b9e81283bb1af5b734422a71277cc')
