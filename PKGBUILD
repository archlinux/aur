# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-chat
_realname=Chat
pkgver=81
pkgrel=1
pkgdesc="Sugar IRC client"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('d92295711b9207b1e6ca3967da7bd913')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

