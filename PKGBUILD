# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=paudit
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Simple Arch package audit script "
arch=(any)
url="https://github.com/Myl0g/paudit"
license=('GPL')
depends=('yaourt')
source=("$pkgname.sh")

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "$pkgname.sh" "$pkgdir/usr/bin/paudit"
}
md5sums=('4a9956c27933cf302c72056aec86201c')
