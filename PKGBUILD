# Maintainer: Joan Figueras <ffigue {at} gmail {dot} com>

pkgname=gtk-theme-inspire-ui
_pkgname=feren
pkgver=1.0.4
pkgrel=1
pkgdesc="feren OS theme, based on Arc Theme. Only works in GNOME 3.18+ and also comes with a Cinnamon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1013327/"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' )
source=("https://dl.opendesktop.org/api/files/download/id/1467300639/feren%20GTK.tar.gz")
md5sums=('a9d85d839eba208ccbdf2f49208de93c')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/themes
	cp -r ${_pkgname}{,-dark} $pkgdir/usr/share/themes
}
