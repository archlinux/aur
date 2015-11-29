# Maintainer: Theo Tosini <theo.tosini@theoduino.me>
_pkgname=bossa
pkgname=bossa-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A GUI and command-line tool to upload to ATSAM microcontrollers"
arch=('i686' 'x86_64')
url="http://www.shumatech.com/web/products/bossa"
license=('GPL')
depends=('gtk2' 'libsm')
makedepends=()
source_i686=(http://downloads.sourceforge.net/project/b-o-s-s-a/${pkgver}/${_pkgname}-i686-${pkgver}.tgz)
source_x86_64=(http://downloads.sourceforge.net/project/b-o-s-s-a/${pkgver}/${_pkgname}-x86_64-${pkgver}.tgz)
md5sums_i686=('baae688a2a5d4cab20e81b6fe63029fd')
md5sums_x86_64=('745cb223437466c701d42da08829964b')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp bossa bossac bossash "$pkgdir/usr/bin"
}
