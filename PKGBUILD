# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=yarl
pkgname=python-${_pkgname}-gns3
pkgver=0.9.8
pkgrel=1
pkgdesc="Yet another URL library (GNS3)"
arch=('any')
url="https://github.com/aio-libs/yarl/"
license=('Apache')
groups=('gns3')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
depends=('python' 'python-multidict')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('1402ac5548c5fabf6072952ee513d084')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}
