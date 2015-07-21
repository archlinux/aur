# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-terminal
_realname=Terminal
pkgver=44
pkgrel=1
pkgdesc="Sugar terminal emulator"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar' 'vte')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('a9569f92a6bae18b3195f9e5dbfff44a')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

