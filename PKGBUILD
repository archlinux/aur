# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=keepass-twofishcipher
_pkgname=TwofishCipher
pkgver=1.4
pkgrel=1
pkgdesc="Enables KeePass to encrypt databases using the Twofish algorithm."
license=('GPL3')
depends=('keepass')
arch=('any')
url="http://gogogadgetscott.info/keepass/twofishcipher/"
source=("http://gogogadgetscott.info/keepass/twofishcipher/$_pkgname-$pkgver.zip")
sha256sums=('a1549af5c3db5d22aaef01539b8851ac5e11ca909bb609f0dcdeebf6dbd9f0b4')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 "$_pkgname.plgx" "${pkgdir}"/usr/share/keepass
}
