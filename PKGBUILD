# Maintainer: Daniel Haß <aur@danielhass.de>
pkgname=vpcs
pkgver=0.6
pkgrel=1
pkgdesc="Simple virtual PC simulator"
arch=(x86_64)
url="http://sourceforge.net/projects/vpcs/"
license=('BSD')
source_x86_64=("vpcs::http://dl.sourceforge.net/${pkgname}/${pkgname}_${pkgver}_Linux64")
source_i686=("vpcs::http://dl.sourceforge.net/${pkgname}/${pkgname}_${pkgver}_Linux32")

md5sums_x86_64=('2aa0db130699da7462b742e8a435ae50')
md5sums_i686=('3fd73f87a295e389af67cd5358dbdfab')

package() {
   mkdir -p "$pkgdir/usr/bin"
   install -Dm755 $srcdir/${pkgname} $pkgdir/usr/bin/${pkgname}  
}

