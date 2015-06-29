# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=sphaerica
pkgver=0.9alpha_2013051LATEST
_pkgver=2013-05-1-LATEST
pkgrel=1
pkgdesc="Interactive spherical geometry software"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$_pkgver.jar \
			sphaerica \
			sphaerica.desktop\
			sphaerica.png)
md5sums=('c63d19b8ce922434ff2bc3376cdae956'
			'f82878d3dd9d3db9e0ece4dbe0ff171c'
			'f44c514c91a4afca7c3062a18455d851'
			'cf88954c32e6df1edc0e644ed26858c8')

package() {
	install -d -m755 ${pkgdir}/usr/share/java/${pkgname}
	install -D -m644 $srcdir/$pkgname-$_pkgver.jar ${pkgdir}/usr/share/java/${pkgname}/$pkgname.jar
	install -D -m755 $srcdir/$pkgname ${pkgdir}/usr/bin/$pkgname
	install -D -m644 $srcdir/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m644 $srcdir/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
