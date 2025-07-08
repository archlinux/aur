pkgname="nightnote"
pkgver="25.0708.1"
pkgrel="3"
pkgdesc="NightNote is a note-taking application."
arch=("x86_64" "aarch64")
license=("custom")
source=("nnote_x86_64" "nnote_aarch64")
sha512sums=("SKIP" "SKIP")
package() {
	mkdir -p "$pkgdir/etc/lingye/nightnote/"
	if ["$ARCH" = "x86_64"]; then
		install -Dm755 "$srcdir/nnote_x86_64" "$pkgdir/usr/bin/nnote"
	elif ["$ARCH" = "aarch64"]; then
		install -Dm755 "$srcdir/nnote_aarch64" "$pkgdir/usr/bin/nnote"
	fi
	}
