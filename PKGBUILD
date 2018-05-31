# Maintainer: Daniel Case <daniel@dashlabs.org>
# Contributor: Andy Kluger <AndyKluger@gmail.com>

_pkgname=x11_hash
pkgname=python-${_pkgname}
pkgver=1.4
pkgrel=1
pkgdesc="Binding for Dash's X11 proof of work hashing."
arch=(any)
url="https://github.com/mazaclub/x11_hash"
license=('MIT')
depends=('python3')
makedepends=('python-setuptools')
source=("https://github.com/mazaclub/x11_hash/archive/${pkgver}.tar.gz")

package_python-x11_hash(){
  cd ${_pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir"
}

md5sums=('aeb83b7e868f504890a6a8d12c9ef2a0')
