# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.40.0
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source_i686=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_32bit_$pkgver.tar.gz")
source_x86_64=("https://github.com/nesbox/tic.computer/releases/download/v$pkgver/tic_64bit_$pkgver.tar.gz")

sha256sums_i686=('02f40b30a27ec8a2823032136c064347dce4ef01727f35cfa74c8dc74f541114')
sha256sums_x86_64=('cd0c3eaba79430fedfd154407790fb0dcd8fe92ad2b2fa250c880694bc2c8393')

package() {
	install -Dm755 tic "${pkgdir}/usr/bin/tic-80"
}
