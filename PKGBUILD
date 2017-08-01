# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.30.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('custom')

source_i686=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_64bit_$pkgver.tar.gz")

sha256sums_i686=('e3062ed4a0b456d4e4ea00c4d65dda57c795ddae84171c1d52fb562a3da893d0')
sha256sums_x86_64=('cbc31cb5d901729874ac30fe9eb8fc74961feae48b89316e1f6417ec42d08904')


package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic-80"
}
