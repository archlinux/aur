# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python2-logbook
_dlpkgname=Logbook
pkgver=0.9.0
pkgrel=1
pkgdesc="logging sytem for Python that replaces the standard library’s logging module"
arch=(any)
url="http://packages.python.org/Logbook/index.html"
license=('BSD')
depends=('python2>=2.6')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/L/Logbook/${_dlpkgname}-${pkgver}.tar.gz")
md5sums=('5bd467a7173dd8aac4d33bb49d709464')

package() {
  cd ${srcdir}/${_dlpkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
