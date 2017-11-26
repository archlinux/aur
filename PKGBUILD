# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.50.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source_i686=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic80_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic80_64bit_$pkgver.tar.gz")

sha256sums_i686=('2b9228c0ea62093d32e73b0c7636a53da7b47456a72ac62e3c4d4da603480938')
sha256sums_x86_64=('b99d9cd05907ca99fce1d6c70deb729c164cf019e588ae5fea021c3939b17b62')

package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic80"
}
