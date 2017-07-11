# Maintainer: Andrew Bezzubtsev <bezzubtsev.andrew@gmail.com>

pkgname=aut
pkgver="11_07_2017"
pkgrel=1
pkgdesc="ArchLinux Upgrade Tool"
arch=('x86_64' 'i686')
url="https://github.com/Andrew-Bezzubtsev/$pkgname"
license=('GPL')
groups=()
provides=()
depends=('zenity' 'gksu')
source=("$url/archive/$pkgver.tar.gz")

md5sums=()

package() {
	cd $srcdir/$pkgname-$pkgver/src
	mkdir -p $pkgdir/usr/bin/
	install aut $pkgdir/usr/bin/
}
md5sums=('2ddb7f8782668727bd16564609ac0b79')
