# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="nyaash"
pkgver="1.2.2"
pkgrel="1"
pkgdesc="Shell script CLI shell script to query nyaa instances."
arch=('any')
depends=('lynx' 'curl')
optdepends=('noto-fonts-cjk: chinese, japanese, and korean characters' 'dmenu: dmenu_nyaash gui')
license=('GPL')
url="https://notabug.org/BezierQuadratic/nyaash"
source=("https://notabug.org/BezierQuadratic/nyaash/archive/$pkgver.tar.gz")
md5sums=('a40a5281ebdc823fc213710a735eba43')
package(){
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/nyaash
	cp -p $srcdir/nyaash/nyaa.sh $pkgdir/usr/bin/nyaash
	cp -p $srcdir/nyaash/dmenu_nyaa.sh $pkgdir/usr/bin/dmenu_nyaash
	cp -p $srcdir/nyaash/LICENSE $pkgdir/usr/share/doc/nyaash/LICENSE
	cp -p $srcdir/nyaash/README.md $pkgdir/usr/share/doc/nyaash/README.md
}
