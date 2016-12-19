# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=bigcty
pkgver=20161121
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
        that are used by amateur radio logging software - EVERYDAY LOGGING VERSION."
arch=('any')
conflicts=('cty')
provides=('cty')
url="http://www.country-files.com/bigcty"
license=('GPL')
source=(${url}/download/${pkgname}-$pkgver.zip)

package() {
	mkdir -p  $pkgdir/usr/share/cty

	cd $srcdir

	cp -R *.{csv,dat} $pkgdir/usr/share/cty
}
md5sums=('74294b241cd49d67b64b155218e5a331')
sha256sums=('3433ca3b15e78ff2d10d5cb377d58954d9f65a84e290052d6be681dd0ba213b9')
