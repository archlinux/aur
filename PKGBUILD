# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: simo <simo@archlinux.org> from extra
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=glchess
pkgver=1.0.6
pkgrel=5
pkgdesc="3D Chess Frontend"
arch=('any')
url="http://glchess.sf.net"
license=('GPL2')
depends=('gnuchess' 'python2-gtkglext' 'python2-imaging' 'pygtk' 'desktop-file-utils')
conflicts=('gnome-games')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/glchess/$pkgname-$pkgver.tar.gz)
md5sums=('b0125b7b824f2e4012badd0c465444dd')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
