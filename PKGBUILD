# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=booktabz
pkgver=1.6
pkgrel=1
pkgdesc="Booktab - Libri di testo multimediali sul tuo tablet e sul tuo computer."
arch=("x86_64")
url="http://booktab.it"
license=('unknown')
depends=('dpkg')
source=('https://booktab.it/setup-z/BooktabZSetup-16.04.deb')
noextract=('BooktabZSetup-16.04.deb')
md5sums=('4d8a16d3d48c255bfbe2f320ffe95e10')

package() {
	cd $srcdir
	dpkg-deb -x BooktabZSetup-16.04.deb $pkgdir
	find $pkgdir/usr -type d -exec chmod 755 {} \;
}

