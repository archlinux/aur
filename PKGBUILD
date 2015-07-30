# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python2-graphy
pkgver=1.0
pkgrel=2
pkgdesc='Simple Chart Library for Python (deprecated Google Chart API)'
arch=(any)
url='https://code.google.com/p/graphy/'
license=(Apache)
depends=(python2)
makedepends=(python2-distribute)
source=(https://graphy.googlecode.com/files/graphy_$pkgver.tar.bz2
        setup.py)
md5sums=('cbf392db1866f3158608f6de97488de1'
         'd42f521be65155367f21b2de88c81122')

package() {
  cd graphy_$pkgver
  cp ../setup.py .
  python2 setup.py install --root="$pkgdir"
}
