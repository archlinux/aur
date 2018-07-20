# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.4.6
pkgrel=1
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64')
url='https://www.brow.sh'
license=('GPL3')
depends=('firefox>=57')
provides=('browsh')
conflicts=('browsh' 'browsh-git')
options=('!strip')
source=("https://github.com/browsh-org/browsh/releases/download/v${pkgver}/browsh_${pkgver}_linux_amd64")
sha512sums=('dddf32e7db13b9840187b8cc27c515feb298e836bfbe4edfae749ca1d002cf0cf603fcb411b8ee88d2326ee49da113d05f58a6f4b3c9627a7cde37b9b3c7de6f')

package() {
	install -Dm755 browsh_${pkgver}_linux_amd64 $pkgdir/usr/bin/browsh
}
