pkgname=gnome-shell-extension-media-controls
pkgver=20
pkgrel=2
pkgdesc="A media indicator for the GNOME shell"
arch=('any')
url="https://github.com/cliffniff/media-controls"
license=('MIT')
makedepends=()
depends=('gnome-shell')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=("https://github.com/cliffniff/media-controls/releases/download/v${pkgver}/extension.zip")
sha256sums=('SKIP')

package() {
	# VERSION_DIR=(ls -Art "$srcdir/$pkgname/builds" | tail -n 1)
	# ZIP_FILE="$srcdir/$pkgname/builds/$VERSION_DIR/extension.zip"
	destdir="$pkgdir/usr/share/gnome-shell/extensions/mediacontrols@cliffniff.github.com/"
	mkdir -p "$destdir"
	install -dm755 "$destdir"

	cp -r "$srcdir" "$destdir"
}