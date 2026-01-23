# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=bigcty
pkgver=20260117
_pkgyear=2026
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
        that are used by amateur (ham) radio logging software - EVERYDAY LOGGING VERSION."
arch=('any')
conflicts=('cty')
provides=('cty')
url="http://www.country-files.com/bigcty"
license=('GPL-3.0-only')
source=(${url}/download/$_pkgyear/$pkgname-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty

	cd $srcdir

	cp -R *.{csv,dat} $pkgdir/usr/share/cty
}
md5sums=('f4ad348f56271fe633919615e211b29d')
sha256sums=('18bee0e4e472b0cffd9ea18eb074cf089052a6c846878fafae8f805761a3ac20')
