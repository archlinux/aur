# Mantainer: Alcasa <alcasa@live.de>

_themename=Numix-Ocean
pkgname=gtk-theme-numix-ocean
pkgver=2.0.2
pkgrel=2
pkgdesc="Base16 Ocean colorscheme version of the Numix theme (supports GTK 2, GTK 3, Xfwm and Openbox)"
arch=('any')
url=('https://github.com/aaronjamesyoung/Numix-Ocean')
license=('GPL3')
depends=('gtk-engine-murrine')
source=('https://github.com/aaronjamesyoung/Numix-Ocean/archive/Ocean.zip')
md5sums=('7ccce16851029b830756e3ec4fc00666')
package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	cd ${srcdir}/
        cp -R ./ ${pkgdir}/usr/share/themes/
}
