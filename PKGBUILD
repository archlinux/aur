# Maintainer: scan
pkgname=night-diamond-cursor-theme
pkgver=3.0
pkgrel=1
pkgdesc="Night Diamond Cursor Theme (Blue/Red)."
arch=('any')
url="https://www.gnome-look.org/p/1295073"
license=('GPL')
source=("night-diamond.tar.gz::https://www.dropbox.com/scl/fi/5jh26h035ck3xbvd5x32h/Night-Diamond-v3.0.tar.xz?rlkey=hnrqpk41df126f33vq7ji9qwg")
sha256sums=('a9750d1de4d3cc7aa54111438383bb8addd63537242c74a81e3c70bc2d00d6f6')

package() {
	mkdir -p $pkgdir/usr/share/icons
	cp -r Night-Diamond/* $pkgdir/usr/share/icons
}
