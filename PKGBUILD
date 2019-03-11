# Maintainer: Edward Pacman <edward@edward-p.xyz>
pkgname=ttf-consolas-with-yahei
pkgver='0.1.1'
pkgrel=0
pkgdesc="Consolas-with-Yahei is a hybrid font(add CJK characters from MS-Yahei to Consolas)"
arch=(any)
url=https://github.com/edward-p/Consolas-with-Yahei
depends=(fontconfig xorg-font-utils)
makedepends=(tar)
fontname='consolas-with-yahei'
source=("https://github.com/edward-p/Consolas-with-Yahei/releases/download/v$pkgver/consya.tar.xz")
md5sums=('7b018121106df894cde2522c32dc6c0b')
install=$pkgname.install
prepare() {
	tar -xvf consya.tar.xz
}
package() {
	mkdir -p "$pkgdir"/usr/share/fonts/$fontname
	chmod -R 755 "$pkgdir"/usr/
	cp $srcdir/consya.ttf "$pkgdir"/usr/share/fonts/$fontname/consya.ttf
	cp $srcdir/consyab.ttf "$pkgdir"/usr/share/fonts/$fontname/consyab.ttf
	cp $srcdir/consyai.ttf "$pkgdir"/usr/share/fonts/$fontname/consyai.ttf
	cp $srcdir/consyaz.ttf "$pkgdir"/usr/share/fonts/$fontname/consyaz.ttf
}
