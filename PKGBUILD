# Maintainer: Gerome Matilla <gerome.matilla07@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-glorious
pkgver=1.0
pkgrel=1
pkgdesc=" a modern and glorified lightdm webkit2 theme"
arch=('any')
url="https://github.com/manilarome/lightdm-webkit2-theme-glorious"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.5-2')
install=
changelog=
source=("https://github.com/manilarome/the-glorious-lightdm-webkit2-theme/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {
	cd "$pkgdir"
	mkdir -p usr/share/lightdm-webkit/themes/
	rm -Rf usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-glorious
	cd usr/share/lightdm-webkit/themes/
	cp --recursive "$srcdir/lightdm-webkit2-theme-glorious-$pkgver" "$pkgname"
}

