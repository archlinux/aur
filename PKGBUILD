# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cty
pkgver=3425
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
md5sums=('cac97b48932dfe9a29524e75c4a05d79')
sha256sums=('37d5e6d08339e63b22443bb096662a78643dc119378a50c3b16a6e7190e5d281')
