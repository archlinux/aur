# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=trisquel-gtk-theme
pkgver=8.0
pkgrel=1
pkgdesc='A GTK2, GTK3, Metacity, XFWM4, and Unity theme from Trisquel.'
url='http://trisquel.info'
arch=('any')
license=('GPL3')
optdepends=('gdk-pixbuf2: gtk2 theme support'
			'gtk-engine-murrine: gtk2 theme support'
			'gtk-engine-unico: gtk3 theme support')
source=("http://archive.trisquel.info/trisquel/pool/main/t/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('0fc769380eba9f58603e5b3f13b5e6a62a570bb66e96ab614cb670fdb3d6c81974c9419c0c4a6f382425e42d61e7190938278f84552eaa52898029e31702be5c')

package() {
	cp -a ${srcdir}/${pkgname}/data/usr ${pkgdir}/
}
