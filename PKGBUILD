# Maintainer: Jörg Thalheim <joerg@higgsboson.tk>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>

pkgname='python-mpd2'
pkgver=0.5.5
pkgrel=1
pkgdesc="Python MPD client library"
url="http://pypi.python.org/pypi/python-mpd2"
license=('GPL3')
makedepends=('python-distribute')
depends=('python')
arch=('any')
source=("http://pypi.python.org/packages/source/p/python-mpd2/python-mpd2-$pkgver.tar.gz")

package() {
  cd "$srcdir/python-mpd2-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('de7af99823cf098acf92d451db2401eb')
sha1sums=('5992324c9ae0340204f783e6f97c56c7888e06ef')
sha256sums=('310e738c4f7ce5b5b10394ec3f182c5240dd3ec55ec59a375924c8004fbb5e51')
