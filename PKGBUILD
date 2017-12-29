# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartosz Feński <fenio@debian.org>

pkgname=dh-make
pkgver=2.201701
pkgrel=2
pkgdesc="tool that converts source archives into Debian package source"
arch=('any')
url="http://packages.debian.org/sid/dh-make"
license=('GPL')
depends=('dpkg' 'perl' 'make' 'python')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('ba9b5f698ac2ec3f5e1cac4af9a51f0f3f7593297092f00936b644a6ae0f70e7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D dh_make $pkgdir/usr/bin/dh_make
  install -d $pkgdir/usr/share/debhelper/dh_make
  cp -a lib/* $pkgdir/usr/share/debhelper/dh_make/
}

# vim:set ts=2 sw=2 et:
