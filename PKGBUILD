# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=py-cpuinfo
pkgver=0.2.3
pkgrel=1
pkgdesc="Get CPU info with pure Python 2 & 3"
arch=('any')
url="https://github.com/workhorsy/py-cpuinfo"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('780ff46a0e122af09cb2c40b2706c6dc')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
