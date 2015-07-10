pkgname=ttf-blogger-sans
pkgver=1.0
pkgrel=1
pkgdesc="Blogger Sans font"
arch=(any)
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source='http://dl.static.1001fonts.net/niceid/b/l/blogger-sans.zip'
md5sums=('dc82cd62c5c4abd94b4e221f061cfa0f')
	license=('Creative Commons Attribution 4.0 - CC BY 4.0')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir/Blogger Sans/OT-tt/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
