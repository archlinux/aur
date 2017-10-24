# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.47.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source_i686=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic_64bit_$pkgver.tar.gz")

sha256sums_i686=('e5b840a0747f9569f1db806cc45989a295e76ae95dddff254395bee37f70de87')
sha256sums_x86_64=('338e643686ea5a0368c16599bc842d7615f8fa6bccc5f316433c86181caaff2f')

package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic-80"
}
