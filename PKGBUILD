# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Michael Bentlage <m.bentlage {at} gmail {dot} com>
pkgname=keepass-de
pkgver=2.48
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
sha1sums=('7ffd2c845471ba3caf277528f9fcacd975116d3e')
md5sums=('efe2e9a8ae07985c52cef6c71d65e800')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
