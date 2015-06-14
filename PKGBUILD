# Maintainer: Vladislav Vishnyakov <split7fire {at} yandex {dot} ru>

pkgname=keepass-ru
pkgver=2.29
pkgrel=4
pkgdesc="Russian locale for KeePass"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=("unzip")
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
arch=(any)
md5sums=('d918572cc34ea670c8386b4fb972d64a')

package(){
  cd ${srcdir}

   install -d "${pkgdir}"/usr/share/keepass
   install -Dm 644 ${srcdir}/*.lngx "${pkgdir}"/usr/share/keepass/
}
