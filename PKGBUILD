# Maintainer: Archadept
#   Revision: 2017-02-07

pkgname=keepass-multicipher
_pkgname=MultiCipher
pkgver=1.0
pkgrel=1
pkgdesc="Enables KeePass to dual encrypt databases using AES-256 and 3DES-192."
license=('GPL3')
depends=('keepass')
arch=('any')
url="http://software.titasraha.com/2016/08/multicipher-plugin-for-keepass.html"
source=("https://sourceforge.net/projects/multicipher-plugin-for-keepass/files/latest/download?source=files")
sha256sums=('8ff382726279744935ffa7d33878ad927bc6f080ba321cb2a6a2bea653830890')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 "$_pkgname.plgx" "${pkgdir}"/usr/share/keepass
}
