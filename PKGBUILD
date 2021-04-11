# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('any')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('Apache')
depends=('gnome-shell' 'python-gobject' 'python-systemd' 'python-fuzzywuzzy')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('8ed25f1b1860931a2b2b28b1241999e8')
sha1sums=('ab3cbc7b0371b35883682e409872854ccc6eb01f')
sha512sums=('2102bf30885834dc819ca9429718778f469502c02d3fe8376604d8140284f0ce76bec73a0e8b51219bceaf8cb1f6d57a525ae232271680b076456b7ee0f489ca')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
}
