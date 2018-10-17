# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: OK100 <ok100 at lavabit dot com>

pkgname=python-glyr
pkgver=1.0.6
pkgrel=1
pkgdesc="Python bindings to libglyr"
url="https://github.com/sahib/python-glyr"
license=('GPL3')
arch=(any)
depends=('python' 'glyr')
makedepends=('git' 'cython')
conflicts=('python-glyr-git')
source=("https://github.com/sahib/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('fc6c1df7359055a013ca4575e10775be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
