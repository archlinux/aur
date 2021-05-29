# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=trisquel-icewm-theme
pkgver=1.4
pkgrel=2
pkgdesc='This IceWM theme is inspired by the default theme of Trisquel GNU/Linux.'
arch=('any')
url='https://www.box-look.org/p/1018259'
license=('GPL3')
depends=('icewm')
source=('https://anonfiles.com/l9G31dycu0/Trisquel_1.4.tar_gz')
sha512sums=('de010d4061ef3c247ee92e52af6557e31a1aeda02844aac011a1dc6c7573fe13d2568954d221c170335ab1d2ab1ed4ed185f59ba003e4a9c034019030b06bb6a')

prepare() {
	echo Removing redundant GPL3 license file...
	rm ${srcdir}/Trisquel/IceWM/Trisquel/COPYING
}

package() {
	install -d ${pkgdir}/usr/share/icewm/themes
	cp -a ${srcdir}/Trisquel/IceWM/Trisquel ${pkgdir}/usr/share/icewm/themes/
}
