# Maintaainer: Rebecca White <rtw at null dot net>

pkgname=backctl-git
pkgver=1.0
pkgrel=1
pkgdesc="A Sensible Backlight Controller"
arch=('any')
url="https://github.com/Kimitzuni/backctl"
license=('GPL-2.0')
makedepends=('make' 'gcc')
conflicts=('backctl')
source=("git+https://github.com/Kimitzuni/backctl")
sha256sums=('SKIP')

build() {
	cd "$srcdir/backctl"
	make
}

package() {
	cd $srcdir/backctl
	mkdir -p $pkgdir/usr/local/bin
	cp backctl $pkgdir/usr/local/bin/
}
