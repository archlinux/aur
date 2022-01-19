# Maintainer: zehkira <(same as my name) at pm me>
pkgname="mili"
pkgver="v0.1.2"
pkgrel=1
pkgdesc="Minimalistic text editor made with Python and GTK"
arch=("any")
url="https://gitlab.com/zehkira/mili"
license=("MIT")
depends=("python-gobject" "gtksourceview3" "hicolor-icon-theme")
source=("https://gitlab.com/zehkira/mili/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
