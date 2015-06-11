# Maintainer: John Ackerman <afuturepilotis at gmail dot com>
pkgname='ambiance-radiance-flat-colors-suite'
pkgver='15.04.1'
pkgrel=2
pkgdesc="Ambiance & Radiance Flat Colors Suite for Unity, Gnome Classic, MATE, XFCE, LXDE and Openbox desktops"
arch=('any')
license=('GPL')
groups=('x11')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/download-ambiance-radiance-flat-colors.html"
depends=('gtk-engine-murrine' 'gtk-engine-unico')
optdepends=('vibrancy-colors')
source=(ambiance-radiance-flat-colors-suite.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAckZjMkc1MUxwU1U)
md5sums=('e5d6d99ed651a680ae26196e849a5ea8')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Ambiance-* Radiance-* "$pkgdir/usr/share/themes/"
}
