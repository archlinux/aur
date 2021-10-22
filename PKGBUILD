# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=docs-gl
_pkgname=docs.gl
pkgver=20211022
pkgrel=1
pkgdesc='an improved version of the official OpenGL documentation'
arch=('any')
url="http://docs.gl/"
license=('custom')
source=("http://docs.gl/docs.gl.zip")
sha512sums=('SKIP')

package() {
	cd $srcdir/htdocs
	install -dm 755 "${pkgdir}/usr/share/doc/docs-gl"
	mv -t "${pkgdir}/usr/share/doc/docs-gl/" $srcdir/htdocs/*
}

