# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: halflife <pigoig_at_gmail_com>

pkgname=keepass-zh-cn
pkgver=2.38
pkgrel=1
pkgdesc="Chinese Simplified locale for keepass"
license=('GPL2')
depends=("keepass" "xdotool")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip)
arch=(any)
sha512sums=('7f202cd550dc4e118091ecccf35acc5bd03ebbe785eafc6d0c543f98bcac180f515574b22c74d247d164ce4b951b9b43b9fa465f50cb28556e608d9e3a41a555')

package(){
   mkdir -p "${pkgdir}/usr/share/keepass/Languages"
   install -m644 Chinese_Simplified.lngx "${pkgdir}/usr/share/keepass/Languages"
}
