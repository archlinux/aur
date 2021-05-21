# Maintainer : Angel Perez <drlorente97@gmail.com>

pkgname="ntfs-automount"
pkgdesc="Automount NTFS drives using an udev rule"
pkgver=0.4
pkgrel=2
url='https://github.com/drlorente97/ntfs-automount'
license=('GPL3')
arch=('any')
depends=('udev' 'ntfs-3g')
source=(https://github.com/drlorente97/ntfs-automount/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('329034c4523b2d73933e6ce59332347b')
MAKEFLAGS="--quiet"
		  
package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
