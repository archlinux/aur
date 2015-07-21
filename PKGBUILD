# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-write
_realname=Write
pkgver=97
pkgrel=1
pkgdesc="Sugar text editor"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('d27d36b8330ab7fba210b86058c65579')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

