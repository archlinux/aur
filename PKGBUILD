# Maintainer: Minhaj SixByte <minhaj.sixbyte@gmail.com>
pkgname=autoexec
pkgver=2020.12.15
pkgrel=2
epoch=
pkgdesc="A development tool for automatic execution of scripts"
arch=('any')
url="https://github.com/terminalforlife/Extra/tree/master/source/autoexec"
license=('GPLv3')
groups=()
depends=('bash' 'coreutils' 'ncurses')
makedepends=()
source=("https://github.com/terminalforlife/DEB-Packages/raw/master/autoexec/autoexec_2020-12-15_all.deb")
noextract=()
md5sums=('SKIP')

package() {
	bsdtar -O -xf "autoexec_2020-12-15_all.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
