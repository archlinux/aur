# Maintainer: Francesco Ruggeri <ruggfrancesco at gmail>
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
pkgname=flexihub-x86_64
pkgver=0.0.1
pkgrel=1
pkgdesc="FlexiHub"
url="http://www.flexihub.com/"
license=('Demo version')

#source=("https://www.flexihub.com/download/flexihub.x86_64.rpm")
source=("https://cdn.eltima.com/download/flexihub.x86_64.rpm")

arch=('x86_64')
depends=('rpmextract')
#md5sums=('7ecfbbb0f0d922d74b22df72f1add7da')

md5sums=('16ad331a2e32a5c09e2055ec9333be9d')
build() {
	rpmextract.sh ../flexihub.x86_64.rpm
}

package() {
	cp -r $srcdir/* $pkgdir
	mv $pkgdir/lib $pkgdir/usr/
}
