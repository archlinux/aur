# Maintainer: tuxifreund <kaiser.barbarossa@yandex.com>
pkgname=mybrowse
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple WebKit browser written in Python3 and using GTK3"
arch=('any')
url="https://github.com/KaiserBarbarossa/MyBrowse"
license=('GPL3')
depends=('webkit2gtk' 'python' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KaiserBarbarossa/mybrowse/archive/v$pkgver.tar.gz")
sha256sums=('2c192f4326299ad433ac50cd53fabe5a8603858e83d99c3603ef792aac97143b')


package() {
	cd "MyBrowse-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	cp mybrowse $pkgdir/usr/bin
	cp mybrowse.desktop $pkgdir/usr/share/applications
}
