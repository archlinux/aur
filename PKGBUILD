# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=booktabz
pkgver=1.5
pkgrel=1
pkgdesc="Booktab - Libri di testo multimediali sul tuo tablet e sul tuo computer."
arch=("x86_64")
url="http://booktab.it"
license=('unknown')
source=('https://booktab.it/setup-z/BooktabZSteup-15.10.deb')
noextract=('BooktabZSteup-15.10.deb')
md5sums=('SKIP')

package() {
 ar p BooktabZSteup-15.10.deb data.tar.xz | tar xJ
 cp usr $pkgdir
}

