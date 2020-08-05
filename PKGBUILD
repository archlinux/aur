# Maintainer : n34r1297 <near1297@nauta.cu>
# Derived from udev-media-automount by Ferk
# EasyArch Project

pkgname="ntfs-automount"
pkgdesc="Automount NTFS drives using an udev rule"
pkgver=0.4
pkgrel=1
url='https://github.com/n34r1297/easyarch/aur/ntfs-automount/'
license=('GPL3')
arch=('any')
depends=('udev' 'ntfs-3g')
source=(https://github.com/n34r1297/aur-repo/raw/master/ntfs-automount/Releases/$pkgname-$pkgver.tar.gz)
md5sums=('d9da8359a4318b892e35407a6ab88dae')
MAKEFLAGS="--quiet"
		  
package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make DESTDIR="${pkgdir}/" install
}
