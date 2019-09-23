# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgname=i3-gnome-flashback
pkgver=3.34.1
pkgrel=1
pkgdesc='Starts i3 inside a GNOME-Flashback session.'
arch=('any')
url='https://github.com/deuill/i3-gnome-flashback'
license=('MIT')
depends=('i3-wm' 'gnome-flashback')
source=("i3-gnome-flashback-$pkgver.tar.gz::https://github.com/deuill/i3-gnome-flashback/archive/$pkgver.tar.gz")
sha1sums=('008871143d7f3a71c8ffc789aac21449e6476993')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
