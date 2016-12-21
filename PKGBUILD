# Maintainer: Francesco Ruggeri <ruggfrancesco at gmail>
pkgname=flexihub-x86_64
pkgver=0.0.1
pkgrel=1
pkgdesc="FlexiHub"
url="http://www.flexihub.com/"
license=('Demo version')
source=("http://www.flexihub.com/download/flexihub.x86_64.rpm")
arch=('x86_64')
sha256sum=('e2702f784907ad906189de92dcbb6410111f02333ff44b971cacb676d43bbbd2')

build() {
	rpmextract.sh ../flexihub.x86_64.rpm
}

package() {
	cp -r $srcdir/* $pkgdir
	mv $pkgdir/lib $pkgdir/usr/
}
