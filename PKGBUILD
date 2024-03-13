# Maintainer: Matthieu Froment <thieume2 {at} hotmail {dot} com>
pkgname=keepass-fr
pkgver=2.56
pkgrel=1
pkgdesc="French locale for keepass"
license=('GPL2')
depends=("keepass")
#makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-French.zip)
arch=(any)
md5sums=('fd24aa7a5e4b87ef7e6cf314b19c52df')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Languages
   install -m644 French.lngx "${pkgdir}"/usr/share/keepass/Languages
}
