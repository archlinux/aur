# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.31
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip)
arch=(any)
md5sums=('ac52b41f19211e1d74ff5fe57445c925')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass
}

