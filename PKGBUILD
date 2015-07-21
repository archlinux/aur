# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-helloworld
_realname=HelloWorld
pkgver=4
pkgrel=1
pkgdesc="Sugar hello world"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('01bd3d41daf3c7126fe54b43feccfb44')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

