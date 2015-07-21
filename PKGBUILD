# Maintainer: ThePilot <afuturepilotis at gmail dot com>
# Contributor: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
pkgname='ambiance-radiance-colors-suite'
pkgver='15.04.1'
pkgrel=4
pkgdesc="Ambiance & Radiance Colors Suite for Unity, Gnome Classic, MATE, XFCE, LXDE and Openbox desktops"
arch=('any')
license=('GPL2')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/ambiance-radiance-colors-suite.html"
depends=('gtk3>=3.14' 'gtk-engine-murrine')
optdepends=('rave-x-colors')
source="$pkgname-$pkgver.tar.gz::https://googledrive.com/host/0B7iDWdwgu9QANXFqSU1wWk14bGs"
md5sums=('0ac06ff4f88fc2303349a1429748a64c')

package() {
  	mkdir -p "$pkgdir/usr/share/themes/"
	cd "$srcdir/"
	cp -r Ambiance-* Radiance-* "$pkgdir/usr/share/themes/"
}
