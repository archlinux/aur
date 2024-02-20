# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=cty
pkgver=3406
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
md5sums=('bf2ee2acb26fcc174f6a2ee294518c4a')
sha256sums=('066931776f6c9029457425c69db3d5d570d9d18093af8d4bfbe694667be077b1')
