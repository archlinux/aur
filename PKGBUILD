# Maintainer: Qian Yicheng <qsp2020@outlook.com>

_target=x86_64-pc-freebsd13
pkgname=freebsdlib
pkgver=13.1
pkgrel=1
pkgdesc='FreeBSD headers and library'
arch=(any)
url='https://www.gnu.org/software/binutils/'
license=(BSD)
depends=()
source=("https://github.com/Easonqsp/freebsdlib/archive/refs/tags/13.1.tar.gz")
sha1sums=('SKIP')
sha256sums=('SKIP')
#validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

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
	cd freebsdlib-13.1
	install -d $pkgdir/usr/$_target/
	cp -r * $pkgdir/usr/$_target/
	cp -r $pkgdir/usr/$_target/lib $pkgdir/usr/$_target/usr
}
