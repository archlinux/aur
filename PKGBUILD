# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=flatpost
pkgver=1.1.0
pkgrel=1
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=('any')
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('flatpak' 'python-requests' 'python-dbus' 'hicolor-icon-theme' 'gtk3' 'appstream' 'gdk-pixbuf2' 'python' 'glib2' 'python-gobject')
makedepends=()
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1417362c64cb7501d3d500a819e143641183ca429dc6e363bca4118263de70eb')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
