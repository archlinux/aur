# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: halflife <pigoig_at_gmail_com>

pkgname=keepass-zh-cn
pkgver=2.40
pkgrel=1
pkgdesc="Chinese Simplified locale for keepass"
license=('GPL2')
depends=("keepass" "xdotool")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip)
arch=(any)
sha256sums=('a861f92867fef1df31eea003061ba18d65d2f505fd2200e19bb64e64d40353af')

package(){
  install -d "${pkgdir}/usr/share/keepass/Languages"
  install -Dm644 Chinese_Simplified.lngx "${pkgdir}/usr/share/keepass/Languages"
}
