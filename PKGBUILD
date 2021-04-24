# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-statistics
pkgver=1.0.3.5
pkgrel=3
pkgdesc='A Python 2.* port of 3.4 Statistics Module'
arch=('any')
url='https://pypi.python.org/pypi/statistics'
license=('PSF')
depends=('python2-docutils')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/${pkgname#*-}/${pkgname#*-}-${pkgver}.tar.gz")
sha512sums=('1d7fd2304a885dbd9ebc564323349f9c5ad1ea1ecea8182b52a1f42308963bd49f07c9dc9f0b87a35d2f6ed3c37429dbc38183c0b1bd65a527558e4504a9a3a0')

package() {
  cd ${pkgname#*-}-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1'

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
