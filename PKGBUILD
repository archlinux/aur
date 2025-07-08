pkgname="nightnote"
pkgver="25.0708.1"
pkgrel="2"
pkgdesc="NightNote is a note-taking application."
arch=("aarch64")
license=("custom")
source=("nnote")
sha512sums=("SKIP")
package(){
	mkdir -p "$pkgdir/etc/lingye/nightnote/"
	install -Dm755 "$srcdir/nnote" "$pkgdir/usr/bin/nnote"
}
