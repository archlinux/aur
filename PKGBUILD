# Maintainer: w0rty <mawo97 at gmail.com>
pkgname=keepass-de
pkgver=2.53
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
md5sums=('d4154932c190a80dfde15dcc19a7e84f')
sha1sums=('fc268a10697dcaa645b9f1dee3ef5be9a3b6989c')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
