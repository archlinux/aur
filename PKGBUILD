# Maintainer: Dawid Majewski < mdawid581 at gmail dot com >
pkgname=sdcc-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="The Small Device C Compiler (SDCC), targeting 8-bit architectures. Precompiled."
arch=('x86_64')
url="https://sourceforge.net/projects/sdcc"
license=('GPL-3.0')

source=("https://github.com/zyriu11/sdcc-bin/releases/download/$pkgver/sdcc-$pkgver-amd64-unknown-linux2.5.tar.bz2")

sha256sums=('3395722e3f8a31ce6a14c75fc419f586a3573b939f85efee5c88cdd35820a240')

package() {
	cp $srcdir/* $pkgdir/usr/local
}