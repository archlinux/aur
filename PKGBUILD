# Maintainer: Andrew Bezzubtsev <bezzubtsev.andrew@gmail.com>

pkgname=aut
pkgver="11_07_2017_1"
pkgrel=1
pkgdesc="ArchLinux Upgrade Tool"
arch=('x86_64' 'i686')
url="https://github.com/Andrew-Bezzubtsev/$pkgname"
license=('GPL')
groups=()
provides=()
depends=('zenity' 'gksu')
source=("$url/archive/$pkgver.tar.gz")

package() {
	cd $srcdir/$pkgname-$pkgver/src
	mkdir -p $pkgdir/usr/bin/
	install aut $pkgdir/usr/bin/
}

md5sums=('72bac83b4cda1ef36cefe80740f72dfc')
