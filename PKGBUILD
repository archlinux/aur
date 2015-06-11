# Maintainer: Jörg Thalheim <joerg@higgsboson.tk>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>

pkgname='python-mpd2'
pkgver=0.5.4
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
md5sums=('d891c3313011dbc6b294c2abf8b87da6')
sha1sums=('af0b2a837603a9eb9a06217e262a08222fc4b40e')
sha256sums=('1cc8f404652a069b3ef2c11de9a8893863be291dc4af5c792eeab0ab06e80ec1')
