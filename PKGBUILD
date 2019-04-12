# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgbase=python-fpconst
pkgname=python2-fpconst
_pkgbasename=fpconst
pkgver=0.7.3
pkgrel=7
pkgdesc="Utilities for handling IEEE 754 floating point special values"
arch=('any')
url="http://pypi.python.org/pypi/fpconst/"
license=('APACHE')
depends=('python2')
conflicts=('python-fpconst<=0.7.3-3')
replaces=('python-fpconst<=0.7.3-3')
source=("http://downloads.sourceforge.net/rsoap/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('c6394ca2bd5d431bd7902a35bb31b976d1ef7461b4b576c77859f4132288a288ccdcf38805cc9f49228a989b94d74846cae3e99b382a5546866f327b436c5cdf')

package_python2-fpconst() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
