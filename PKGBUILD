# Maintainer: Andrew Rabert <arabert at nullsum dot net>
# Contributor: Andrew Rabert <arabert at nullsum dot net>
pkgname=python-enzyme
pkgver=0.4.1
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/e/enzyme/enzyme-${pkgver}.tar.gz")
md5sums=('1656e262295df6580db5498cf136d23a')

package() {
  cd "${srcdir}/enzyme-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
