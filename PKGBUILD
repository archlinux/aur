pkgname=caviar-dreams
pkgver=1.0
pkgrel=1
pkgdesc="Caviar Dreams Font"
arch=(any)
url=http://www.1001freefonts.com/caviar_dreams.font
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("http://www.1001freefonts.com/d/6693/caviar_dreams.zip")
install=$pkgname-fonts.install
md5sums=('0fc6ddd765d88d7e788dc9c2ad2be2ab')

package(){
	cd "$srcdir"
	install -m 644 -D "CaviarDreams.ttf" "$pkgdir/usr/share/fonts/caviar-dreams/caviar-dreams.ttf"
	install -m 644 -D "Caviar Dreams Bold.ttf" "$pkgdir/usr/share/fonts/caviar-dreams/caviar-dreams-bold.ttf"
	install -m 644 -D "CaviarDreams_BoldItalic.ttf" "$pkgdir/usr/share/fonts/caviar-dreams/caviar-dreams-bold-italic.ttf"
	install -m 644 -D "CaviarDreams_Italic.ttf" "$pkgdir/usr/share/fonts/caviar-dreams/caviar-dreams-italic.ttf"
}
