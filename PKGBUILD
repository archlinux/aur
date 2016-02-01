# Maintainer: Francesco Ruggeri <ruggfrancesco at gmail>
pkgname=flexihub-x86_64
pkgver=0.0.1
pkgrel=1
pkgdesc="FlexiHub"
url="http://www.flexihub.com/"
license=('Demo version')
source=("http://www.flexihub.com/download/flexihub.x86_64.rpm")
arch=('x86_64')
makedepends=('rpmextract')
md5sums=('edb2c98fd6f0bc903747d91e5075a429')

build() {
	rpmextract.sh ../flexihub.x86_64.rpm
}

package() {
	cp -r $srcdir/* $pkgdir
	mv $pkgdir/lib $pkgdir/usr/
}
