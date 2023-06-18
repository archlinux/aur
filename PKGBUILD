pkgname=windows-10-cursor
pkgver=1.1
pkgrel=1
pkgdesc='A Windows 10 light and dark cursor theme'
arch=(any)
source=($pkgname.tar.xz::https://github.com/red-magic/dotfiles/raw/master/extra/themes/cursor-themes/$pkgname.tar.xz)
b2sums=(df4ac4bea6776e6eff066795321b00ee0c139269a89cf8e14f408ad4e15b6e5ff97a869c47ea6488fa521e574740ad7774672aa7808cfb1f04dd352e2981b72a)

package() {
	mkdir -p $pkgdir/usr/share/icons
	cp -r $pkgname/{Windows-10-Light,Windows-10-Dark} $pkgdir/usr/share/icons
}
