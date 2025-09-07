# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=flatpost-bin
pkgver=1.1.0
_fedora=42
pkgrel=1
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=(any)
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('gdk-pixbuf2' 'gtk3' 'glib2' 'flatpak' 'hicolor-icon-theme' 'python-dbus' 'python-gobject' 'python-requests' 'python' 'appstream')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$url/releases/download/$pkgver/flatpost-$pkgver.fc${_fedora}.rpm")
sha256sums=('5ef9ce82f36c4b5afc85bacfa73dcabc8bd652a524f52e8587422ffaa58b56fd')
validpgpkeys=()

package() {
	cd "$srcdir"
	cp -a --no-preserve=ownership usr "$pkgdir"
}
