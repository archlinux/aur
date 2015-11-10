# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=trisquel-wallpapers
pkgver=7.0_1
pkgrel=1
pkgdesc="Trisquel GNU/Linux Wallpapers, the default Wallpapers for Trisquel."
url="http://trisquel.info"
arch=('any')
license=('GPL')
depends=()
optdepends=()
makedepends=()
backup=()
install=''
source=("http://archive.trisquel.info/trisquel/pool/main/t/trisquel-wallpapers/trisquel-wallpapers_${pkgver/_/-}.tar.gz")
md5sums=('a4454ea0eb82977dd239468af80c5300')
         
package() {
   install -dm755 ${pkgdir}/usr/share/backgrounds/Trisquel
   cp ${srcdir}/trisquel-wallpapers/data/usr/share/backgrounds/* ${pkgdir}/usr/share/backgrounds/Trisquel/
}
