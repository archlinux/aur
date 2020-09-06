# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgname=i3-gnome-flashback
pkgver=3.36.1
pkgrel=1
pkgdesc='Starts i3 inside a GNOME-Flashback session.'
arch=('any')
url='https://github.com/deuill/i3-gnome-flashback'
license=('MIT')
depends=('i3-wm' 'gnome-flashback')
source=("i3-gnome-flashback-$pkgver.tar.gz::https://github.com/deuill/i3-gnome-flashback/archive/$pkgver.tar.gz")
sha1sums=('af4c8993405c4044d965913ec548ede4322cd892')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
