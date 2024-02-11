# Maintainer: scan
pkgname=night-diamond-cursor-theme
pkgver=3.0
pkgrel=2
pkgdesc="Night Diamond Cursor Theme (Blue/Red)."
arch=('any')
url="https://www.gnome-look.org/p/1295073"
license=('GPL')
source=("night-diamond.tar.gz::https://www.dropbox.com/scl/fi/t8sgcrdoirfu618n5wp9b/Night-Diamond-v3.0.tar.xz?rlkey=bq2mqzr3u064ms85zt0gin7nq")
sha256sums=('5e7ead5975521718de6c3bd707def51068af2f8061fff68a320cf4284135237e')

package() {
	mkdir -p $pkgdir/usr/share/icons
	cp -r Night-Diamond/* $pkgdir/usr/share/icons
}
