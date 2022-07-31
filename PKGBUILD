# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=bigcty
pkgver=20220729
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
md5sums=('3d804b81baa2d19c820b33d61cba1e69')
sha256sums=('48d892dc8ae3ffab4a39cffaa068f8ac3528833b9c128232c183f9146208552e')
