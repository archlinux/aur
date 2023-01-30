# Maintainer: Qian Yicheng <qsp2020@outlook.com>

_target=x86_64-pc-openbsd7
pkgname=openbsdlib
pkgver=7.2
pkgrel=1
pkgdesc='FreeBSD headers and library'
arch=(any)
url='https://www.gnu.org/software/binutils/'
license=(BSD)
depends=()
source=("https://github.com/Easonqsp/openbsdlib/archive/refs/tags/7.2.tar.gz")
sha1sums=('SKIP')
sha256sums=('SKIP')
prepare() {
	echo pass
}

build() {
	echo pass
}

check() {
	echo pass
}

package() {
	cd openbsdlib-7.2
	install -d $pkgdir/usr/$_target/
	cp -r * $pkgdir/usr/$_target/
#	cp -r $pkgdir/usr/$_target/lib $pkgdir/usr/$_target/usr
}
