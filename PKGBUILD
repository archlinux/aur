# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.50.1
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source_i686=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic80_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic80_64bit_$pkgver.tar.gz")

sha256sums_i686=('20e2256029da28642577348f342aeed912b4c6f2399a47d1b3eac4c8588b755f')
sha256sums_x86_64=('85439d9b957bd9e1497c80e70ac0b1bd578eaf8a71605c72d0bc0728410655e0')

package() {
	install -Dm755 tic80 "${pkgdir}/usr/bin/tic80"
}
