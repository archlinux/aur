# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>
pkgname=dh-make
pkgver=1.20140617
pkgrel=1
pkgdesc="tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('debhelper' 'dpkg' 'perl' 'make')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('1b33c7fadacbe629889aec54d3a1a9cc1a3dd20b5ef04abdde9f14a1c3ea399e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make $pkgdir/usr/bin/dh_make
  install -d $pkgdir/usr/share/debhelper/dh_make
  cp -a lib/* $pkgdir/usr/share/debhelper/dh_make/
}

# vim:set ts=2 sw=2 et:
