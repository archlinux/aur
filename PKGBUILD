# Maintainer: Alexander Konarev  <avkonarev@gmail.com>

pkgname=libconfig9
pkgver=1.6
_libver='1.6-2'
pkgrel=1
pkgdesc="C/C++ Configuration File Library 1.6 release"
arch=('x86_64' 'i686')
url="https://github.com/hyperrealm/libconfig"
license=('LGPL')
depends=('libconfig')
source=("https://archive.archlinux.org/packages/l/libconfig/libconfig-$_libver-$CARCH.pkg.tar.xz")
md5sums=('SKIP')
conflicts=('libconfig=1.6')

package() {
  mkdir -p $pkgdir/usr/lib
  find $srcdir/usr/lib -name 'libconfig*.so.9*' -exec cp -a {} $pkgdir/usr/lib \;
}

# vim:set ts=2 sw=2 et:
