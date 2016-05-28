# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

_pkgname=genson
pkgname=python2-${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc="GenSON is a powerful, user-friendly JSON Schema generator."
arch=('any')
url="https://pypi.python.org/pypi/genson"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b6bb0f826eabd13e755d564291121307')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
