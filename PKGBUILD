# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.45.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source_i686=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_64bit_$pkgver.tar.gz")

sha256sums_i686=('52991b15c5eb5c79ecf36f25b5015fe6b1ef83abdfcc54b5b2d84a772f93a6dd')
sha256sums_x86_64=('847d75e64395d1316e092c92e899ed455cb2d6aa86aaf6b8b3b4ac9a1e4d34f7')

package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic-80"
}
