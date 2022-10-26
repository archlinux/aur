# Maintainer: Berfin <3a33oxx40@mozmail.com>
# Previous Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: St�phane Gaudreault <stephane.gaudreault@gmail.com>

pkgname=latencytop
pkgver=0.5.0.0.1
_pkgver="latencytop_0.5.0-0.1~bpo11+1"
pkgrel=1
pkgdesc="A tool for software developers, aimed at identifying where system latency occurs."
arch=(x86_64)
url="http://ftp.de.debian.org/debian/pool/main/l/latencytop" # used to be http://www.latencytop.org but Intel appears to have killed it
depends=('gtk2' 'ncurses' 'gdk-pixbuf2' 'glib2')
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/l/latencytop/${_pkgver}_amd64.deb")
md5sums=('ae4ca840a7d4163250abc15ce1d25d67')

package() {
	tar -xvf data.tar.xz
	mv ${srcdir}/usr/sbin ${srcdir}/usr/bin
	cp -r ${srcdir}/usr ${pkgdir}
}
