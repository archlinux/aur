# $Id$
# Maintainer: Tjahneee <b2t@protonmail.com>

pkgname=tic-80
pkgver=0.30.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('x86_64')
url="https://tic.computer/"
license=('custom')
source=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_64bit_$pkgver.tar.gz")
md5sums=('9846448171bc27ee6e287a510ac9febe')


package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic-80"
}
