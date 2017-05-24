# Contributor: Anatoly V. Beregovoy <avberegovoy@gmail.com>
# Maintainer: Anatoly V. Beregovoy <avberegovoy@gmail.com>

pkgname=libpasastro
pkgver=1.1
pkgrel=14
pkgdesc="Provide Pascal interface for standard astronomy libraries"
arch=('x86_64')
url="http://www.sourceforge.net/projects/libpasastro/"
license=('GPLv2')
depends=()
makedepends=()
options=()
source=(http://downloads.sourceforge.net/sourceforge/libpasastro/libpasastro-$pkgver-14-linux_$arch.tar.xz)
md5sums=('e31c5312bb531ab82995d469ee3a9105')

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -D -m755 lib/*                $pkgdir/usr/lib/
  install -D -m644 share/doc/$pkgname/* $pkgdir/usr/share/doc/$pkgname/
}
