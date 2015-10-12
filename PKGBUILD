# Maintainer: M0Rf30

_pkgname=darkcoin_hash
pkgname=python2-${_pkgname}
pkgver=1.3
pkgrel=1
pkgdesc="Binding for Darkcoin X11 proof of work hashing."
arch=(any)
url="https://github.com/vertoe/darkcoin_hash"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/vertoe/darkcoin_hash/archive/$pkgver.tar.gz")

package(){
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir"
}

md5sums=('56bf68eb020d08a603eb0589cd513faf')
