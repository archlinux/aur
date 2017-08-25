# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgname=i3-gnome-flashback
pkgver=1.0
pkgrel=1
pkgdesc='Starts i3 inside a GNOME-Flashback session.'
arch=('any')
url='https://github.com/deuill/i3-gnome-flashback'
license=('MIT')
depends=('i3-wm' 'gnome-flashback')
source=("i3-gnome-flashback-$pkgver.tar.gz::https://github.com/deuill/i3-gnome-flashback/archive/$pkgver.tar.gz")
sha1sums=('7fbb1cce48f453f30e26894059731f2cdd2c9a2e')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
