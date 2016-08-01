# Maintainer: Joan Figueras <ffigue {at} gmail {dot} com>

pkgname=gtk-theme-arc-red
_pkgname=Arc-Red
pkgver=20160626
pkgrel=1
pkgdesc="A red variation of Horst3180's Arc Theme. A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell."
arch=('any')
url="https://github.com/mclmza/arc-theme-Red"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' )
source=("https://github.com/mclmza/arc-theme-Red/releases/download/1/Arc-Red-theme.zip")
md5sums=('e42de839d1276dea93ad88397344baf5')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/themes
	cp -r ${_pkgname}{,-Dark,-Darker} $pkgdir/usr/share/themes
}
