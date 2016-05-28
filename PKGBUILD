pkgname=geo-sans-light
pkgver=1.0
pkgrel=1
pkgdesc="Geo Sans Light Font"
arch=(any)
url=http://www.1001freefonts.com/geo_sans_light.font
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("http://www.1001freefonts.com/d/9711/geo_sans_light.zip")
install=$pkgname-fonts.install
md5sums=('d6278466cc127edf93c6dfb13ccc6644')

package(){
	cd "$srcdir"
	install -m 644 -D "GeosansLight.ttf" "$pkgdir/usr/share/fonts/geo-sans-light/geo-sans-light.ttf"
}
