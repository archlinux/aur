pkgname=champagne-limousines
pkgver=1.0
pkgrel=1
pkgdesc="Champagne & Limousines Font"
arch=(any)
url=http://www.1001freefonts.com/champagne___limousines.font
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("http://www.1001freefonts.com/d/6694/champagne___limousines.zip")
install=champagne-limousines-fonts.install
md5sums=('4b24c2581d6621899437b027e26611ed')

package(){
	cd "$srcdir"
	install -m 644 -D "Champagne & Limousines.ttf" "$pkgdir/usr/share/fonts/champagne-limousines/champagne-limousines.ttf"
	install -m 644 -D "Champagne & Limousines Bold.ttf" "$pkgdir/usr/share/fonts/champagne-limousines/champagne-limousines-bold.ttf"
	install -m 644 -D "Champagne & Limousines Italic.ttf" "$pkgdir/usr/share/fonts/champagne-limousines/champagne-limousines-italic.ttf"
	install -m 644 -D "Champagne & Limousines Bold Italic.ttf" "$pkgdir/usr/share/fonts/champagne-limousines/champagne-limousines-bold-italic.ttf"
}
