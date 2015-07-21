# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-pippy
_realname=Pippy
pkgver=66
pkgrel=1
pkgdesc="Sugar interactive python editor"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('bd35a47bab11b95c28197811d2706d04')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

