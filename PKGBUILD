# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=keepass-ja
pkgver=2.41
pkgrel=1
pkgdesc="Japanese locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Japanese.zip)
arch=(any)
md5sums=('bb2bac725de991d35aec26ff28d2562d')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Japanese.lngx "${pkgdir}"/usr/share/keepass
}
