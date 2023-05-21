# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=bigcty
pkgver=20230521
_pkgyear=2023
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
md5sums=('e22882dcb7d628a7c1c64b9472838cc6')
sha256sums=('fcb54811459a63a63ecd9a39dadad5d9b1f54d8bfc9e8e0c897aad95bfd497c4')
