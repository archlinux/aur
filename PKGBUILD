# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>
pkgname=dh-make
pkgver=0.63
pkgrel=1
pkgdesc="tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('debhelper' 'dpkg' 'perl' 'make')
source=(http://ftp.debian.org/debian/pool/main/d/dh-make/dh-make_$pkgver.tar.gz)
md5sums=('aa0e6502d682d3c6d97b81ce2d414c87')

package() {
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/debhelper/dh_make
  cp $srcdir/$pkgname/dh_make $pkgdir/usr/bin
  cp -a $srcdir/$pkgname/lib/* $pkgdir/usr/share/debhelper/dh_make/
}

# vim:set ts=2 sw=2 et:
