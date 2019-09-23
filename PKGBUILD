# Maintainer: Joan Figueras <ffigue {at} gmail {dot} com>

pkgname=gtk-theme-inspire-ui
_pkgname=Inspire-Icon-Theme-master
pkgver=1.0.4
pkgrel=2
pkgdesc="feren OS theme, based on Arc Theme. Only works in GNOME 3.18+ and also comes with a Cinnamon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1013327/"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' )
source=("https://github.com/feren-OS/Inspire-Icon-Theme/archive/master.zip")
md5sums=('42bce84947876e9370f320370e74adc8')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r ${_pkgname}/Inspire{,\ Dark} $pkgdir/usr/share/icons
}
