# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=bigcty
pkgver=20220521
_pkgyear=2022
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
        that are used by amateur (ham) radio logging software - EVERYDAY LOGGING VERSION."
arch=('any')
conflicts=('cty')
provides=('cty')
url="http://www.country-files.com/bigcty"
license=('GPL')
source=(${url}/download/$_pkgyear/$pkgname-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty

	cd $srcdir

	cp -R *.{csv,dat} $pkgdir/usr/share/cty
}
md5sums=('4fdb4b7944807cb4a02e008dd672e5f6')
sha256sums=('d512685200c7c6777480764c30a86c22619eef7f9dbba9d80b4d5b2aeeef9431')
