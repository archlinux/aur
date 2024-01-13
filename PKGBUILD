# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libthesky-data
pkgver=20231226
pkgrel=1
pkgdesc="Data files for libTheSky"
arch=('any')
url="http://libthesky.sourceforge.net/"
license=('GPL3')
changelog=ChangeLog
source=("https://sourceforge.net/projects/libthesky/files/$pkgname-$pkgver.tar.bz2")
sha512sums=('ba2242788eb2735ef7b59a4b3453e27121899d6721b6950f492be7f24707bb8609a0dc0c45e76487fd9f40c45be44412fbc3c48aaf2f83437fff7de7c6bd60c5')

package() {
	mkdir -p      ${pkgdir}/usr/share/libTheSky/
	cp -vp data/* ${pkgdir}/usr/share/libTheSky/
}
