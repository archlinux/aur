#Maintainer: Francois Boulogne <fboulogne at april.org>

pkgname=spread0r
pkgver=1.0
pkgrel=2
pkgdesc="txt reader which makes you reading twice as fast as usual"
arch=("any")
url="https://github.com/xypiie/spread0r"
license=("GPL2")
depends=("perl" "gtk2-perl")
source=(https://github.com/xypiie/spread0r/archive/v${pkgver}.tar.gz)


package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	#install -D ${pkgname}.pl "${pkgdir}"/usr/bin/${pkgname}
	install -D gritz.pl "${pkgdir}"/usr/bin/${pkgname}
	install -D lib/Hyphen.pm "${pkgdir}"/usr/lib/perl5/vendor_perl/Hyphen.pm

}


md5sums=('3d9c44c2c4ce56de0c9214e6e7e8b9a3')
