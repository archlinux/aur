# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>
pkgname=dh-make
pkgver=2.201606
pkgrel=2
pkgdesc="tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'perl' 'make' 'python2-enum34')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('a86c2a80d1e5d3d3c9a15eca4beed28e0a0a2f99bdb8f756a0abfdd6005c10ec')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make $pkgdir/usr/bin/dh_make
  install -d $pkgdir/usr/share/debhelper/dh_make
  cp -a lib/* $pkgdir/usr/share/debhelper/dh_make/
}

# vim:set ts=2 sw=2 et:
