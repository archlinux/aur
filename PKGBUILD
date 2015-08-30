# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=python2-webcolors
pkgver=1.4
pkgrel=2
pkgdesc="Provides utility functions for working with the color names and color value formats defined by the HTML and CSS specifications."
arch=(any)
url="http://pypi.python.org/pypi/webcolors/"
license=(BSD)
depends=(python2)
makedepends=(python2-distribute)
conflicts=(python2-webcolors-hg)
source=("http://pypi.python.org/packages/source/w/webcolors/webcolors-${pkgver}.tar.gz")
md5sums=('35de9d785b5c04a9cc66a2eae0519254')

package() {
  cd "${srcdir}/webcolors-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
