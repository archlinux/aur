# Maintainer: mr2meows <mr2meows@disroot.org>
pkgname=lib32-freearc-bin
pkgver=0.51
pkgrel=2
pkgdesc='free and open-source high-performance file archiver'
arch=('x86_64')
url=https://sourceforge.net/projects/freearc/
license=('GPL-2.0')
depends=('lib32-ncurses5-compat-libs' 'lib32-gmp' 'lib32-gtk2' 'lib32-libpng12')
conflicts=('unarc')
source=("https://sourceforge.net/projects/freearc/files/FreeArc/FreeArc%20$pkgver/FreeArc-$pkgver-linux-i386.tar.bz2/download")
package() {
	cd "${srcdir}/FreeArc-$pkgver-linux-i386"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/lib/FreeArc
	cp -r bin/* ${pkgdir}/usr/bin
	cp -r lib/* ${pkgdir}/usr/lib/FreeArc
	mkdir -p ${pkgdir}/etc/FreeArc
	cp -r cfg/* ${pkgdir}/etc/FreeArc
	}
sha256sums=('9671d829a3961abc064721d25f10d109f7830cbd0d9dd9a6f6be72b3bbade6eb')
