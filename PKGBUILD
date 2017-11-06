# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=python2-webcolors
pkgver=1.7
pkgrel=1
pkgdesc="Provides utility functions for working with the color names and color value formats defined by the HTML and CSS specifications."
arch=(any)
url="https://github.com/ubernostrum/webcolors"
license=(BSD)
depends=(python2)
makedepends=(python2-distribute)
conflicts=(python2-webcolors-hg)
source=("https://github.com/ubernostrum/webcolors/archive/${pkgver}.tar.gz")
md5sums=('1b41c64d122e14f73b5386743fddf955')

package() {
  cd "${srcdir}/webcolors-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
