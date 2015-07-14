# Maintainer: John Ackerman <afuturepilotis at gmail dot com>
pkgname='ambiance-radiance-flat-colors-suite'
pkgver='15.04.4'
pkgrel=2
pkgdesc="Ambiance & Radiance Flat Colors Suite for Unity, Gnome Classic, MATE, XFCE, LXDE and Openbox desktops"
arch=('any')
license=('GPL')
groups=('x11')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/download-ambiance-radiance-flat-colors.html"
depends=('gtk-engine-murrine')
optdepends=('vibrancy-colors')
source=(ambiance-radiance-flat-colors-suite.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QATjFSZW5OYThqeWM)
md5sums=('6d384fb15d6da777db12589fa99ce8b4')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Ambiance-* Radiance-* "$pkgdir/usr/share/themes/"
}
