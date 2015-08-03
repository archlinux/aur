# Maintainer: Ondrej Hruska <ondra@ondrovo.com>

pkgname=scide
pkgver=7.4.6
pkgrel=2
pkgdesc="Sleepy Cat IDE, ARM dev environment developed at CTU Prague"
arch=('i686' 'x86_64')
url="http://pck338-242.feld.cvut.cz/scide/"
depends=(libusb java-environment java-runtime)
license=('GPL')
source=("http://pck338-242.feld.cvut.cz/scide/scide_7.4.6-1_all.deb")
md5sums=('7a4f140379737dadbe87fd0037ec2df0')
options=(!strip)

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/scide/bin/netbeans" "${pkgdir}/usr/bin/scide"
}
