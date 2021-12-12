# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: halflife <pigoig_at_gmail_com>
# Maintainer: xlwz <xlwzforever@outlook.com>

pkgname=keepass-zh-cn
pkgver=2.46
pkgrel=1
pkgdesc="Chinese Simplified locale for keepass"
license=('GPL2')
depends=("keepass>=2.46")
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip)
arch=(any)
sha256sums=('3db8169b35d2565453f0fb942666d1ca28db6f263f2e9dbd9fbada126a252adf')

package() {
  install -d "${pkgdir}/usr/share/keepass/Languages"
  install -Dm644 Chinese_Simplified.lngx "${pkgdir}/usr/share/keepass/Languages"
}
