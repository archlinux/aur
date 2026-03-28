# Maintainer: w0rty <mawo97 at gmail.com>
pkgname=keepass-de
pkgver=2.61
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
md5sums=('24337ec5d7afc4db914e561fac2212a1')
sha1sums=('8a1f23e06b40c5dc79f998a61c7b6dace8bb3003')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
