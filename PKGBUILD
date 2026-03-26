# Maintainer: Dmitriy Q <krotesk{at}mail{dot}ru>
# Contributor: Vladislav Vishnyakov <split7fire {at} yandex {dot} ru>

pkgname=keepass-ru
pkgver=2.61
pkgrel=1
pkgdesc="Russian locale for KeePass"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=("unzip")
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
arch=(any)
md5sums=('65dcabd9aa7b8ee524bbe0b3d2a00dfb')

package(){
  cd ${srcdir}

   install -d "${pkgdir}"/usr/share/keepass/Languages/
   install -Dm 644 ${srcdir}/*.lngx "${pkgdir}"/usr/share/keepass/Languages/
}
