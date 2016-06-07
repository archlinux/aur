# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=x-tools-armv7-bin
pkgver=20160601
pkgrel=1
pkgdesc="crosstool-ng toolchain - x-tools package for armv7h compiling"
arch=('x86_64')
url="https://archlinuxarm.org/wiki/Distcc_Cross-Compiling"
license=('GPL3')
provides=('apw')
depends=('xz')
options=(!emptydirs)
source=('https://archlinuxarm.org/builder/xtools/x-tools7h.tar.xz')
md5sums=('SKIP')
install=$pkgname.install
noextract=('x-tools7h.tar.xz')
package() {
	mkdir -p "$pkgdir/usr/x-tools"
	tar -Jxf "$srcdir/x-tools7h.tar.xz" -C "$pkgdir/usr/x-tools" 
}