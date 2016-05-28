# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

_pkgname=multipledispatch
pkgname=python2-${_pkgname}
pkgver=0.4.8
pkgrel=1
pkgdesc="A relatively sane approach to multiple dispatch in Python."
arch=('any')
url="https://pypi.python.org/pypi/multipledispatch"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f0eb0c527cdbe788ca7dcd1511bc49a9')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
