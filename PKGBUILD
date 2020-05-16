# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname=keepass-ja
pkgver=2.45
pkgrel=1
pkgdesc="Japanese locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Japanese.zip)
arch=(any)
md5sums=('2c5780a9052f6ccd584444129e9c0790')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 Japanese.lngx "${pkgdir}"/usr/share/keepass
}
