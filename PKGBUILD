# Contributor: Anatoly V. Beregovoy <avberegovoy@gmail.com>
# Maintainer: Anatoly V. Beregovoy <avberegovoy@gmail.com>

pkgname=libpasastro
pkgver=1.1
pkgrel=20
pkgdesc="Provide Pascal interface for standard astronomy libraries"
arch=('x86_64')
url="http://www.sourceforge.net/projects/libpasastro/"
license=('GPLv2')
depends=()
makedepends=()
options=()
source=(http://downloads.sourceforge.net/sourceforge/libpasastro/libpasastro-$pkgver-$pkgrel-linux_$arch.tar.xz)
md5sums=('c7badbb08010af30833437f6b671f7cf')

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -D -m755 lib/*                $pkgdir/usr/lib/
  install -D -m644 share/doc/$pkgname/* $pkgdir/usr/share/doc/$pkgname/
}
