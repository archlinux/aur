# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-jukebox
_realname=Jukebox
pkgver=32
pkgrel=1
pkgdesc="Sugar juke box"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('8aa4d5d82a4d3ec3e75612aba9df14c4')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

