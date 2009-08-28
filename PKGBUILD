# Maintainer : Biru Ionut <ionut@archlinux.ro>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-xcb-util
pkgver=0.3.6
pkgrel=1
pkgdesc="Utility libraries for XC Binding"
arch=('x86_64')
license=('GPL')
groups=('lib32')
depends=('lib32-glibc' 'lib32-libxcb')
url="http://xcb.freedesktop.org"
source=(http://mir.archlinux.fr/extra/os/i686/${pkgname/lib32-/}-${pkgver}-${pkgrel}-i686.pkg.tar.gz)

build() {
  mkdir -p $pkgdir/opt/lib32/usr/lib/
  cp -R $srcdir/usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}
md5sums=('4bfca93cee96f5b825f8eb4e82c395b9')
