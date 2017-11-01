# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

pkgname=i3-gnome-flashback
pkgver=1.1
pkgrel=1
pkgdesc='Starts i3 inside a GNOME-Flashback session.'
arch=('any')
url='https://github.com/deuill/i3-gnome-flashback'
license=('MIT')
depends=('i3-wm' 'gnome-flashback')
source=("i3-gnome-flashback-$pkgver.tar.gz::https://github.com/deuill/i3-gnome-flashback/archive/$pkgver.tar.gz")
sha1sums=('bc4aa43bc5bb3b06fda6f8a1824a8a91b8a4e65b')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
