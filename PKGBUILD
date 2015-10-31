# Maintainer: ThePilot <afuturepilotis at gmail dot com>
# Contributor: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
pkgname='ambiance-radiance-colors-suite'
pkgver='15.10.1'
pkgrel=1
pkgdesc="Ambiance & Radiance Colors Suite for Unity, Gnome Classic, MATE, XFCE, LXDE and Openbox desktops"
arch=('any')
license=('GPL2')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/ambiance-radiance-colors-suite.html"
depends=('gtk3>=3.14' 'gtk-engine-murrine')
optdepends=('rave-x-colors')
source=("$pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QAMV8wQThOdTVENWs")
md5sums=('b8c0127a5b171926bf28863f6e7047e7')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Ambiance-* Radiance-* "$pkgdir/usr/share/themes/"
}
