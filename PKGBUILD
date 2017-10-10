# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.46.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source_i686=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/TIC-80/releases/download/v$pkgver/tic_64bit_$pkgver.tar.gz")


sha256sums_i686=('c328714da729c71b839e0657cf3e0249674d1320a9c6f18e755be0caa1da5115')
sha256sums_x86_64=('5ee25660ebeff127b5a17982c5de3b39ba5ddce25869a3b227a6afe8635a2a59')


package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic-80"
}
