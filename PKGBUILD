# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>
pkgname=dh-make
pkgver=2.201608
pkgrel=1
pkgdesc="tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'perl' 'make' 'python2-enum34')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('50c9930d06caae27577408636dd4dac1f75ea5c9577bfec809a49257d21ce020')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make $pkgdir/usr/bin/dh_make
  install -d $pkgdir/usr/share/debhelper/dh_make
  cp -a lib/* $pkgdir/usr/share/debhelper/dh_make/
}

# vim:set ts=2 sw=2 et:
