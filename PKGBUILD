# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=python2-caldav
pkgver=0.2.2
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://bitbucket.org/cyrilrbt/caldav/wiki/Home"
license=('GPL')
depends=('python2' 'python2-lxml' 'python2-vobject' 'python2-dateutil' 'python2-distribute')
backup=()
conflicts=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/c/caldav/caldav-${pkgver}.tar.gz)

package() {
  cd "$srcdir/caldav-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
md5sums=('c038dcd9564fa1260ebb25976f136610')
sha1sums=('b8d84565aeb5be77d3572b172acf7f4aff8ad0df')
sha256sums=('845ed1c76c6755e0d036ddf7bf4f77d159edaaafa62561b9125b09712d944ef9')
