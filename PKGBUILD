# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: schnouki <thomas.jost@gmail.com>

pkgname=lib32-libcap
pkgname32=libcap
pkgver=2.19
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities - 32bit version"
arch=('x86_64')
url="http://www.kernel.org/pub/linux/libs/security/linux-privs/"
license=('GPL')
depends=('lib32-glibc')
source=("ftp://ftp.archlinux.org/core/os/i686/$pkgname32-$pkgver-$pkgrel-i686.pkg.tar.gz")

build() {
  mkdir -p $pkgdir/opt/lib32/lib
  cp -a $srcdir/lib/libcap* $pkgdir/opt/lib32/lib
}
md5sums=('52aec2d36cb4b7a527ed5b7025fd0e4b')
sha256sums=('0233c25d755b68da6c8fa45f3772ab42aee3598f69c3cccedf6994fd972d7993')
