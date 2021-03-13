# Maintainer: robertfoster

_pkgname=indy
pkgname=python-${_pkgname}
pkgver=1.16.0
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

sha256sums=('63e42389cd53c66574b8af0979d6ff7acfb5ff0da7a9d5bf37c789ac99ca0dd4')
