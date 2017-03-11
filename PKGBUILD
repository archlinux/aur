# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=keepass-ja
pkgver=2.35
pkgrel=1
pkgdesc="Japanese locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Japanese.zip)
arch=(any)
md5sums=('11ec1da198997ddbb97477f90bcee23e')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Japanese.lngx "${pkgdir}"/usr/share/keepass
}
