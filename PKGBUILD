# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: halflife <pigoig_at_gmail_com>

pkgname=keepass-zh-cn
pkgver=2.39
pkgrel=1
pkgdesc="Chinese Simplified locale for keepass"
license=('GPL2')
depends=("keepass" "xdotool")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip)
arch=(any)
sha256sums=('bf5b628b2a5da523d6f0ef6fbb83a86c566ec741e28ce5ccaf6b305ca4c615dd')

package(){
  mkdir -p "${pkgdir}/usr/share/keepass/Languages"
  install -m644 Chinese_Simplified.lngx "${pkgdir}/usr/share/keepass/Languages"
}
