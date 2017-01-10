# Maintainer: Magno-Tutor
pkgname=portscan
pkgver=1.0
pkgrel=1
pkgdesc="PortScan aims to check open and closed ports quickly."
arch=('any')
depends=('python')
install=portscan.install
url="https://github.com/Sup3r-Us3r/PortScan"

source=('portscan.py')

md5sums=('61735ad7ef0026b47635d279b51a299e')

package() {
	
	install -D portscan.py "${pkgdir}/usr/bin/portscan"

}