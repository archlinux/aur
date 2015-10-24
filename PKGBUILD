# Maintainer: Daniel Haß <mail@danielhass.de>
pkgname=vpcs
pkgver=0.8
pkgrel=1
pkgdesc="Simple virtual PC simulator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vpcs/"
license=('BSD')
source_x86_64=("vpcs::http://dl.sourceforge.net/${pkgname}/${pkgname}_${pkgver}a_Linux64")
source_i686=("vpcs::http://dl.sourceforge.net/${pkgname}/${pkgname}_${pkgver}a_Linux32")



package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${pkgname} $pkgdir/usr/bin/${pkgname}  
}


md5sums_i686=('ea310a27e9fb13c08f320f695741ba48')
md5sums_x86_64=('d43e24ac50f65323702d16f9d232edea')
