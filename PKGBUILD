# Maintainer: Markus Stephany<merkes at mirkes dot de>
pkgname=dumphive
pkgver=0.0.3
pkgrel=1
pkgdesc="A tool extracts keys and values from Windows registry files and dump to a text file"
arch=(x86_64)
url="https://launchpad.net/dumphive"
license=('BSD')
depends=()
makedepends=('fpc')
source=("https://sourceforge.net/projects/ekeyfinder/files/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.tar.gz")
sha256sums=('25f7b07466153f9e74a432c178214b881edb09948fd8bcbd2ec30787bdd347a2')
build(){
	cd ${srcdir}/${pkgver}-${pkgrel}/src
	make
}
package(){
	install -D ${srcdir}/${pkgver}-${pkgrel}/src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
