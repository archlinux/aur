# Maintainer: Archadept
#   Revision: 2019-09-06

pkgname=keepass-multicipher
_pkgname=MultiCipher
pkgver=2.0
pkgrel=1
pkgdesc="Enables KeePass to dual encrypt databases using two ciphers with independent keys."
license=('GPL3')
depends=('keepass>=2.41')
arch=('any')
url="http://software.titasraha.com/2016/08/multicipher-plugin-for-keepass.html"
source=("https://sourceforge.net/projects/multicipher-plugin-for-keepass/files/latest/download")
sha256sums=('767da29472816877e5cc81f82a8f32db3494357e69c4589abdaccd889422db08')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 "$_pkgname.plgx" "${pkgdir}"/usr/share/keepass
}
