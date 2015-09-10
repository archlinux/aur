# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=python2-enzyme
pkgver=0.4.1
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=(LGPL)
depends=(python2)
makedepends=(python2-distribute)
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/e/enzyme/enzyme-${pkgver}.tar.gz")
md5sums=('1656e262295df6580db5498cf136d23a')

package() {
  cd "${srcdir}/enzyme-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
