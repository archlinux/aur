# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cty
pkgver=3520
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
md5sums=('4cde7b5c2d6c125c93daa2c25c40a0a6')
sha256sums=('55deb51083465084718e1d3d01e58581ba9e0963e8334446467c8943266d338d')
