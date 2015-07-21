# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=gtk-theme-egtk
pkgver=4.0.4
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable. Lastest version from Launchpad."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPLv2')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
provides=('gtk-theme-elementary-bzr')
conflicts=('elementary-gtk-theme' 'elementary-gtk-theme-bzr')
source=(https://launchpad.net/egtk/4.x/${pkgver}/+download/elementary.tar.xz)
md5sums=('89388e3c31db64fb57a0aabdb544a636')

package () {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/themes/
	cp -r elementary $pkgdir/usr/share/themes
}
