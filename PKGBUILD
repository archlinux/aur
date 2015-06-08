# Maintainer: blackleg <blackleg@openmailbox.org>

pkgname=xplane-sdk-devel
pkgver=2.1.3
pkgrel=3
pkgdesc="X-Plane SDK"
url='http://www.xsquawkbox.net/xpsdk/mediawiki/Main_Page'
arch=("any")
license=('unknown')
depends=()
source=("http://www.xsquawkbox.net/xpsdk/XPSDK213.zip")

md5sums=('0c052de90a83e9f7f0f3aae532fe3640')


package() {
	cd "$srcdir/SDK/CHeaders"
	
	mkdir -p "$pkgdir/usr/include/xplane_sdk"
	mkdir -p "$pkgdir/usr/include/xplane_sdk/Widgets"
	mkdir -p "$pkgdir/usr/include/xplane_sdk/Wrappers"
	mkdir -p "$pkgdir/usr/include/xplane_sdk/XPLM"

	install -D -m755 ./Widgets/* "$pkgdir/usr/include/xplane_sdk/Widgets"
	install -D -m755 ./Wrappers/* "$pkgdir/usr/include/xplane_sdk/Wrappers"
	install -D -m755 ./XPLM/* "$pkgdir/usr/include/xplane_sdk/XPLM"


}
