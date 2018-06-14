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
source=("https://pypi.python.org/packages/source/e/enzyme/enzyme-${pkgver}.tar.gz")
sha512sums=('62a85c076a7eb320249a507dcc9dd26572e3a9b9643e0a960ed114a80c75213e6e5028a726fbcdd0c2c46c53af980a69828a54a66af9a17af3210273376395b3')

package() {
  cd "${srcdir}/enzyme-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
