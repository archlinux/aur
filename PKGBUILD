# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=trisquel-gtk-theme
pkgver=9.0
pkgrel=4
pkgdesc='A GTK2, GTK3, Metacity, XFWM4, and Unity theme from Trisquel.'
url='http://trisquel.info'
arch=('any')
license=('GPL3')
optdepends=('gdk-pixbuf2: gtk2 theme support'
			'gtk-engine-murrine: gtk2 theme support'
			'gtk-engine-unico: gtk3 theme support')
source=("http://archive.trisquel.info/trisquel/pool/main/t/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.tar.gz")
sha512sums=('17bbb8f8768aff3d4a75ba111bd05a02a19652d8eb953e66fae49f46c726a4822ee951ea8ceac2054bba96de2770ebce358f1258bf952bf3d124f2aedf9aa2cf')

package() {
	cp -a ${srcdir}/${pkgname}-${pkgver}/data/usr ${pkgdir}/
}
