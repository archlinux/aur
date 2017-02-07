# Maintainer: Archadept
#   Revision: 2017-02-07

pkgname=keepass-gostcipher
_pkgname=GostPlugin
pkgver=2.1
pkgrel=1
pkgdesc="Enables KeePass to encrypt databases using the GOST R 34.12-2015 algorithm."
license=('GPL2')
depends=('keepass')
arch=('any')
url="https://github.com/yaruson/GostPlugin"
source=("https://github.com/yaruson/$_pkgname/releases/download/$pkgver/${_pkgname}.plgx")
md5sums=('1c4e2ee2cbe44eb4a454ee56ad86cf68')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 "$_pkgname.plgx" "${pkgdir}"/usr/share/keepass
}
