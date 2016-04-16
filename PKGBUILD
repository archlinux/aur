# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libthesky-data
pkgver=20160409
pkgrel=1
pkgdesc="Data files for libTheSky"
arch=('any')
url="http://libthesky.sourceforge.net/"
license=('GPL3')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libthesky/files/$pkgname-$pkgver.tar.bz2")
sha512sums=('b790aa70b60c6c35db85a54de3487aa5ef47710121cb6c6c13069d4d8adba822b61449eb59ce7ec9203fb4d9cf33570222ec9a65b36ac21f5d4506cddd0b35a3')

package() {
	mkdir -p      ${pkgdir}/usr/share/libTheSky/
	cp -vp data/* ${pkgdir}/usr/share/libTheSky/
}
