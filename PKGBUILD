# Maintainer: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>
_program=alpine-make-rootfs
_coder=alpinelinux

pkgname="$_program"
pkgver=0.5.1
pkgrel=1
pkgdesc="Builds customized Alpine Linux rootfs for containers."
arch=('any')
source=("$_program-$pkgver.tar.gz::https://github.com/$_coder/$_program/archive/v$pkgver.tar.gz")
license=('MIT')

package() {
	cd "$_program-$pkgver"
	make DESTDIR="$pkgdir/" install
}

md5sums=('cc05fef878335316a8ae2c13658c505f')
