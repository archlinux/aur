# Maintainer: Dmitriy Q <krotesk{at}mail{dot}ru>
# Contributor: Vladislav Vishnyakov <split7fire {at} yandex {dot} ru>

pkgname=keepass-ru
pkgver=2.54
pkgrel=1
pkgdesc="Russian locale for KeePass"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=("unzip")
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
arch=(any)
md5sums=('fca818c73869df3ef4c947bc4e9b6489')

package(){
  cd ${srcdir}

   install -d "${pkgdir}"/usr/share/keepass/Languages/
   install -Dm 644 ${srcdir}/*.lngx "${pkgdir}"/usr/share/keepass/Languages/
}
