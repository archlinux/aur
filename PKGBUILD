# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: halflife <pigoig_at_gmail_com>
# Maintainer: XLWZ <xlwzforever@xlwz.moe>

pkgname=keepass-zh-cn
pkgver=2.51
pkgrel=1
pkgdesc="Chinese Simplified locale for keepass"
license=('GPL2')
depends=("keepass>=2.51")
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip)
arch=(any)
sha1sums=('fc74707ee688ab196cfa8ecfb88aaed7776f960a')

package() {
  install -d "${pkgdir}/usr/share/keepass/Languages"
  install -Dm644 Chinese_Simplified.lngx "${pkgdir}/usr/share/keepass/Languages"
}
