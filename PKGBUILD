# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=booktabz
pkgver=1.7
pkgrel=1
pkgdesc="Booktab - Libri di testo multimediali sul tuo tablet e sul tuo computer."
arch=("x86_64")
url="http://booktab.it"
license=('unknown')
source=('https://booktab.it/setup-z/BooktabZSetup-16.04.deb')
noextract=('BooktabZSetup-16.04.deb')
md5sums=('07a7fb9efb841a1b52ca6e9fa9c8b505')

package() {
	bsdtar -Oxf $srcdir/BooktabZSetup-16.04.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
	find $pkgdir/usr -type d -exec chmod 755 {} \;
}

