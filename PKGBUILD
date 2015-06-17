# Maintainer: 

pkgname=python2-straight.plugin
pkgver=1.4.0.p1
_ver=1.4.0-post-1
pkgrel=1
pkgdesc='A simple namespaced plugin facility'
arch=(any)
url='https://github.com/ironfroggy/straight.plugin'
license=(MIT)
depends=(python2)
source=(https://pypi.python.org/packages/source/s/straight.plugin/straight.plugin-$_ver.tar.gz)
md5sums=('e1a22847055f377fa4c9a99d733eb44c')

package() {
  cd straight.plugin-$_ver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
