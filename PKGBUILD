# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=PyQuante
pkgname=python2-pyquante
pkgver=1.6.5
pkgrel=1
pkgdesc="An open-source suite of programs for developing quantum chemistry methods written in Python."
arch=("i686" "x86_64")
url="http://pyquante.sourceforge.net/"
license=("BSD")
depends=("python2")
source=("http://downloads.sourceforge.net/project/pyquante/PyQuante-1.6/${_name}-${pkgver}/${_name}-${pkgver}.tar.gz")
md5sums=('cf34cad6ab80226cca31fa0d08d875cc')

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
