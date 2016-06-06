# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=python2-osrf-pycommon
_pkgname=osrf_pycommon
pkgver=0.1.2
pkgrel=1
pkgdesc="Commonly needed Python modules, used by Python software developed at OSRF"
arch=(any)
url="https://github.com/osrf/osrf_pycommon"
license=('Apache')
depends=('python2' 'python2-trollius')
source=("https://github.com/osrf/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('562020a22797338d834a549c4c291ece')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
