# orig. Maintainer: simo <simo@archlinux.org> from extra
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=glchess
pkgver=1.0.6
pkgrel=4
pkgdesc="3D Chess Frontend"
arch=('i686' 'x86_64')
url="http://glchess.sf.net"
license=('GPL2')
depends=('gnuchess' 'gtkglext' 'python2-imaging' 'pygtk')
conflicts=('gnome-games')
source=(http://downloads.sourceforge.net/glchess/$pkgname-$pkgver.tar.gz)
md5sums=('b0125b7b824f2e4012badd0c465444dd')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}
