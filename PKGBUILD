pkgname=scriptina
pkgver=1.0
pkgrel=1
pkgdesc="Scriptina Font"
arch=(any)
url=http://www.1001fonts.com/scriptina-font.html
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("http://dl.1001fonts.com/scriptina.zip")
install=$pkgname-fonts.install
md5sums=('9e68ef659cdcfd92d24e62cfd312ca77')

package(){
	cd "$srcdir"
	install -m 644 -D "SCRIPTIN.ttf" "$pkgdir/usr/share/fonts/scriptina/scriptin.ttf"
}
