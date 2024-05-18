# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=isomacprog
pkgver=2016
pkgrel=1
pkgdesc='Program to make a standard Linux 64-bit distro ISO compatible with 32-bit EFI Macs'
arch=('x86_64')
url='https://mattgadient.com/linux-dvd-images-and-how-to-for-32-bit-efi-macs-late-2006-models/'
license=('custom:isomacprog')
source=('isomacprog.c::https://mattgadient.com/dl/linux-iso-program/isomacprog.c.txt')
sha256sums=('800693bd0bb9f11e7553e3dee02d0456d42c789e78ae06b70b667b2043f1f447')

build() {
	gcc $CFLAGS isomacprog.c -o isomacprog
}

package() {
	install -Dm755 isomacprog "$pkgdir/usr/bin/isomacprog"
}
