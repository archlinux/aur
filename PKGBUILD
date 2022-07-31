# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cty
pkgver=3227
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
	that are used by amateur (ham) radio logging software - CONTESTING VERSION."
arch=('any')
provides=('cty')
conflicts=('bigcty')
url="http://www.country-files.com/cty"
license=('GPL')
source=(${url}/download/$pkgver/${pkgname}-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty/old

	cd $srcdir

	chmod 644 * old/*
	cp -R *.{cty,dat} old $pkgdir/usr/share/cty
}
md5sums=('4cc4b5815666bd8eee9b1f8304d3d052')
sha256sums=('d53ce2b51fd989bf95e65b9270cb112cff9fe47106e6ada85690413daa5095b4')
