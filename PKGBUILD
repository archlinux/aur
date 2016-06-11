# Maintainer: halflife <pigoig_at_gmail_com>
pkgname=keepass-zh-cn
pkgver=
pkgrel=1
pkgdesc="Chinese Simplified locale for keepass"
license=('GPL2')
depends=("keepass" "xdotool")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=()
arch=(any)
sha512sums=('SKIP')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass"
   install -m644 Chinese_Simplified.lngx "${pkgdir}/usr/share/keepass"
}
