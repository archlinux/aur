# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=bigcty
pkgver=20250609
_pkgyear=2025
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
md5sums=('5a2a5ba444c98c59426e21c39b535c0d')
sha256sums=('41371a694a6e35c7afd21d57291bb76b995e832446eb2e589994eb3077820861')
