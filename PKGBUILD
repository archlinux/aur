# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=sugar-activity-imageviewer
_realname=ImageViewer
pkgver=62
pkgrel=1
pkgdesc="Sugar image viewer"
arch=('any')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('fructose')
depends=('sugar')
source=(http://download.sugarlabs.org/sources/sucrose/fructose/${_realname}/${_realname}-$pkgver.tar.bz2)
md5sums=('3767449ae711ca9aac115a5bfd61572f')

package() {
  cd "$srcdir/${_realname}-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr" || return 1
}

