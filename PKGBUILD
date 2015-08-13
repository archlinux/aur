# Maintainer: Vladislav Vishnyakov <split7fire {at} yandex {dot} ru>

pkgname=keepass-ru
pkgver=2.30
pkgrel=1
pkgdesc="Russian locale for KeePass"
license=('GPL2')
depends=("keepass>=${pkgver}")
makedepends=("unzip")
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Russian.zip)
arch=(any)
md5sums=('7dfe3d8ef064462c719b65e7ecd44853')

package(){
  cd ${srcdir}

   install -d "${pkgdir}"/usr/share/keepass
   install -Dm 644 ${srcdir}/*.lngx "${pkgdir}"/usr/share/keepass/
}
