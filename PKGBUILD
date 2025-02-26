# Maintainer: Dmitriy Q <krotesk{at}mail{dot}ru>
# Contributor: Vladislav Vishnyakov <split7fire {at} yandex {dot} ru>

pkgname=keepass-ru
pkgver=2.57.1
pkgrel=1
pkgdesc="Russian locale for KeePass"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=("unzip")
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
arch=(any)
md5sums=('7e90893a4efde2aa464090ccbd04e457')

package(){
  cd ${srcdir}

   install -d "${pkgdir}"/usr/share/keepass/Languages/
   install -Dm 644 ${srcdir}/*.lngx "${pkgdir}"/usr/share/keepass/Languages/
}
