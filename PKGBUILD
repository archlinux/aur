# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="nyaash"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Shell script CLI shell script to query nyaa instances."
arch=('any')
depends=('lynx')
license=('GPL')
url="https://notabug.org/BezierQuadratic/nyaash"
source=("https://notabug.org/BezierQuadratic/nyaash/archive/$pkgver.tar.gz")
md5sums=('302637792329d824de040d49669f2c98')
package(){
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/nyaash
	cp -p $srcdir/nyaash/nyaa.sh $pkgdir/usr/bin/nyaash
	cp -p $srcdir/nyaash/LICENSE $pkgdir/usr/share/doc/nyaash/LICENSE
	cp -p $srcdir/nyaash/README.md $pkgdir/usr/share/doc/nyaash/README.md
}
