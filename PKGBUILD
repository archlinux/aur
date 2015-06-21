# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=psgrep
pkgver=1.0.6
pkgrel=1
pkgdesc="Process list search thru grep"
arch=('i686' 'x86_64')
url="http://code.google.com/p/psgrep/"
license=('GPL3')
source=(http://psgrep.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2d74c8746950c2b4efe5eac96303bf09') 

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm755 psgrep ${pkgdir}/usr/bin/psgrep
	install -Dm644 psgrep.1 ${pkgdir}/usr/share/man/man1/psgrep.1
}

