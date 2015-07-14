# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
pkgname=keepass-twofishcipher
_pkgname=TwofishCipher
pkgver=1.3
pkgrel=1
pkgdesc="Enables KeePass to encrypt databases using the Twofish algorithm."
license=('GPL3')
depends=('keepass')
arch=('any')
url="http://gogogadgetscott.info/keepass/twofishcipher/"
source=("http://gogogadgetscott.info/keepass/twofishcipher/$_pkgname-$pkgver.zip")
sha256sums=('d0ebc7f1e709eaddcd37a1d4ea4a5c9bc5b924588390bf93a5840b5ba0114124')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 "$_pkgname.plgx" "${pkgdir}"/usr/share/keepass
}
