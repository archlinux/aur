# Maintainer: Michael Kogan <michael dot kogan at gmx dot net >

pkgname=racer-nocg-car-69-chevrolet-camaro-z28
pkgver=2013
pkgrel=3
pkgdesc='1969 Chevrolet Camaro Z/28 car model for Racer (CG version) by Cosmo°'
arch=('any')
license=(custom)
url='http://www.racedepartment.com/threads/chevrolet-camaro-z-28-1969.29105/'
depends=('racer-nocg')
makedepends=('unrar')
source=("https://xbqz4w-bn1ap000.files.1drv.com/y4mRAidfaOjgToEPQW0EMSoWbx7UhRP8m2DWIhYWtMYTpAt15N7WApmql3HO6LVlXc7X6QUfqZ_RdyB0Tt2rtLKZwZWbDIxc5sgYTR7HBHzVmokusvclOmphIVsRjpXPRjPe4qz5QtDuutO1Qy2iU1E_S9rHMRb4wW7vlEMuukwwEvIpERzmVdp9uluNp7RHlZJ/corvette69.rar")
noextract=("corvette69.rar")
md5sums=('c64abafebceceae5115891d6316dd59a')

prepare(){
	unrar x -y "$srcdir/corvette69.rar"
}
package(){
	install -d -m755 "$pkgdir/opt/racer-nocg/cars/"
	cp -drT "$srcdir/corvette69" "$pkgdir/opt/racer-nocg/cars/69ccz28"
}
