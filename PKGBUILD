# Maintainer: Andrew Gregory Neumann <agneum14@gmail.com>
pkgname=wmdots
pkgver=1
pkgrel=1
pkgdesc="Window Maker dockapp which displays multi shape 3D rotating dots"
arch=('x86_64')
url="https://www.dockapps.net/wmdots"
license=('GPL')
depends=('libdockapp' 'libxpm' 'libx11' 'glibc' 'libxcb' 'libxau' 'libxdmcp')
optdepends=('windowmaker')
changelog=
source=("$pkgname.tar.gz::https://repo.or.cz/dockapps.git/snapshot/6b1c8231816e24d160299183556fe65856a866eb.tar.gz")
md5sums=('SKIP')

build() {
	cd dockapps-*
	make
}

package() {
	cd dockapps-*
	install -Dm755 ./wmdots "$pkgdir/usr/bin/wmdots"
}
