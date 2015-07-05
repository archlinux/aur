# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=bigcty
pkgver=20141127
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
md5sums=('298fcaf4f0f8a5feeb92ca718bff1ad8')
sha256sums=('e3b3ca4841a52610525845cdc3693a8b866242b9ccd16c903ae6bea639a10d0d')
