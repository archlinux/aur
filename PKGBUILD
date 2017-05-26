# Maintainer: Andy Kluger <AndyKluger@gmail.com>

_pkgname=x11_hash
pkgname=python2-${_pkgname}
pkgver=1.4
pkgrel=1
pkgdesc="Binding for Dash's X11 proof of work hashing."
arch=(any)
url="https://github.com/mazaclub/x11_hash"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://github.com/mazaclub/x11_hash/archive/${pkgver}.tar.gz")

package(){
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir"
}

md5sums=('aeb83b7e868f504890a6a8d12c9ef2a0')
