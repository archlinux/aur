# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=bigcty
pkgver=20170308
pkgrel=1
pkgdesc="The package represents databases of entities (countries), prefixes and callsigns
        that are used by amateur (ham) radio logging software - EVERYDAY LOGGING VERSION."
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
md5sums=('efef7333188278cbfda691784dcd124e')
sha256sums=('2c334ded94fdf81419a18daefb70e7bd09531af058ff4d2db9eda81ffc98d997')
