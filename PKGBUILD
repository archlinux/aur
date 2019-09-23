# Maintainer: Joan Figueras <ffigue {at} gmail {dot} com>

pkgname=gtk-theme-inspire-ui
_pkgname=feren-theme-master
pkgver=1.0.4
pkgrel=2
pkgdesc="feren OS theme, based on Arc Theme. Only works in GNOME 3.18+ and also comes with a Cinnamon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1013327/"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' )
source=("https://github.com/feren-OS/Inspire-Icon-Theme/archive/master.zip")
md5sums=('ecf732c38eeeb7bc6117751f1002005c')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/themes
    cd ${_pkgname}
    for f in *\ * ; do mv -v "${f}" "${f// /_}"; done
	cp -r feren* $pkgdir/usr/share/themes
}
