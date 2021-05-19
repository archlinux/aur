# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: St�phane Gaudreault <stephane.gaudreault@gmail.com>

pkgname=latencytop
pkgver='0.5+b4'
pkgrel=1
pkgdesc="A tool for software developers, aimed at identifying where system latency occurs."
arch=(x86_64)
url="http://git.infradead.org/latencytop.git" # used to be http://www.latencytop.org but Intel appears to have killed it
depends=('gtk2' 'ncurses' 'gdk-pixbuf2' 'glib2')
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/l/latencytop/latencytop_${pkgver}_amd64.deb")
md5sums=('bf6f7271da9165620ac37e960e95cb40')

package() {
	tar -xvf data.tar.xz
	mv ${srcdir}/usr/sbin ${srcdir}/usr/bin
	cp -r ${srcdir}/* ${pkgdir}
}
