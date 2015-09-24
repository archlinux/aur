# Maintainer: vatriani <vatriani.nn@googlemail.com>
pkgname=xlauncher
pkgver=0.4.0
pkgrel=1
pkgdesc='simple and fast launcher for x11'
arch=('x86_64' 'i686')
url='https://github.com/vatriani/xlauncher'
license=('LGPL3')
depends=('libx11')
source=("git+https://github.com/vatriani/xlauncher")
md5sums=('SKIP')


build() {
	cd "xlauncher"
	make
}

package() {
	cd "xlauncher"
	install -Dm777 xlauncher "$pkgdir/usr/bin/xlauncher"
}
