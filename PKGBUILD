# Maintainer: D7OMDEV <hello@d7om.dev>
pkgname=clipse-gui
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK3 GUI for the Clipse clipboard manager"
arch=('x86_64')
url="https://github.com/d7omdev/clipse-gui"
license=('MIT')
depends=('gtk3' 'wl-clipboard' 'python' 'python-gobject')
makedepends=('nuitka' 'gcc' 'make' 'python-build' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
