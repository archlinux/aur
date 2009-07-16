# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>

pkgname=lib32-xcb-util
pkgver=0.3.4
pkgrel=2
pkgdesc="Utility libraries for XC Binding"
arch=(x86_64)
license=('GPL')
groups=('lib32')
depends=('lib32-glibc' 'lib32-libxcb')
url="http://xcb.freedesktop.org"
source=(ftp://ftp.archlinux.org/extra/os/i686/${pkgname/lib32-/}-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=('880098724fab81864953f44fc0fbc6bd')

build() {
  mkdir -p $pkgdir/opt/lib32/usr/lib/
  cp -R $srcdir/usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}
 
