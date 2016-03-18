# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>
pkgname=dh-make
pkgver=2.201605
pkgrel=1
pkgdesc="tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'perl' 'make')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('19a0bf5179d600785177aaf3d74ecedf7f565a5b8b609f5a947d5c8c51275aa9')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make $pkgdir/usr/bin/dh_make
  install -d $pkgdir/usr/share/debhelper/dh_make
  cp -a lib/* $pkgdir/usr/share/debhelper/dh_make/
}

# vim:set ts=2 sw=2 et:
