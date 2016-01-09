# Maintainer: Daniel Haß <aur@hass.onl>
pkgname=vpcs
pkgver=0.8
pkgrel=2
pkgdesc="Simple virtual PC simulator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vpcs/"
license=('BSD')
source_x86_64=("vpcs::http://dl.sourceforge.net/${pkgname}/${pkgname}_${pkgver}b_Linux64")
source_i686=("vpcs::http://dl.sourceforge.net/${pkgname}/${pkgname}_${pkgver}b_Linux32")



package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${pkgname} $pkgdir/usr/bin/${pkgname}  
}


md5sums_i686=('e480ca6b6c3a89e75d7aa26dab1ee3f7')
md5sums_x86_64=('d2c717a10c0040cec5dc39d32b8bca55')
