# Maintainer: M0Rf30

_pkgname=coinhash
pkgname=python2-${_pkgname}
pkgver=1.1.4
pkgrel=1
pkgdesc="Compilation of coin hash algorithms."
arch=(any)
url="https://github.com/mazaclub/coinhash"
license=('MIXED')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/mazaclub/coinhash/archive/$pkgver.tar.gz")

package(){
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir"
}

md5sums=('b8c3bdd3b42be7bb3a5f59eb636883c4')
