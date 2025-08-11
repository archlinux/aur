# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cty
pkgver=3526
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
	that are used by amateur (ham) radio logging software - CONTESTING VERSION."
arch=('any')
provides=('cty')
conflicts=('bigcty')
url="http://www.country-files.com/cty"
license=('GPL-3.0-only')
source=(${url}/download/$pkgver/${pkgname}-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty/old

	cd $srcdir

	chmod 644 * old/*
	cp -R *.{cty,dat} old $pkgdir/usr/share/cty
}
md5sums=('932ff1fc31ac9b76c8dbeedf40ad7534')
sha256sums=('ef71c7459f46e5d5d3260b793a8eb55a825d2e360fbd70e9ee77738d5370fe89')
