# $Id: PKGBUILD 114747 2014-07-03 16:27:48Z fyan $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kaa-imlib2
pkgver=0.2.3
pkgrel=6
pkgdesc="KAA imlib2 package"
url="http://freevo.sourceforge.net/"
license=('GPL2')
depends=('imlib2' 'python2' 'kaa-base')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/freevo/$pkgname-$pkgver.tar.gz)
md5sums=('64828ede785ab0dd2d3c1f2f36c99342')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install -O1 --prefix="$pkgdir/usr"
}
