pkgname=bitmask
pkgver=0.10.2
pkgrel=1
pkgdesc="easy and secure encrypted communication"
arch=('x86_64')
url="https://bitmask.net/"
license=('GPL3')
groups=('base-devel')
source=(https://dl.bitmask.net/client/linux/stable/Bitmask-linux64-latest.tar.gz bitmask.desktop)
md5sums=(94bb24e9068d9ca71ced7469aa18a43d 9da51e679f8217e510bac857a7008e51)

package() {
	mkdir -p "${pkgdir}/usr/share/applications/"
	mkdir "${pkgdir}/opt/"
	mv bitmask.desktop "${pkgdir}/usr/share/applications/"
	tar -zxf Bitmask-linux64-latest.tar.gz -C "${pkgdir}/opt/"
	mv "${pkgdir}/opt/bitmask-0.10.2" "${pkgdir}/opt/bitmask"
}
