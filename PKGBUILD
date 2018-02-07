# Maintainer: Philip Goto <philip.goto@gmail.com>

# BlackBoard username and password
_username=
_password=

pkgname=civic
pkgver=1.0.0
pkgrel=1
pkgdesc="CiviC Toolchain used in the UvA Compiler Construction course"
arch=('x86_64')
license=('custom:UvA Proprietary')
source=("toolchain-linux-x64-static.tgz::https://${_username}:${_password}@blackboard.uva.nl/bbcswebdav/pid-6926466-dt-content-rid-10679020_1/xid-10679020_1")
md5sums=('a42d166e73b8454e839c1c7d7fcd8036')

package() {
    cd "${srcdir}/bin/"
    install -dm 755 "${pkgdir}/usr/bin"
    install -m 755 "civas" "${pkgdir}/usr/bin"
    install -m 755 "civcc" "${pkgdir}/usr/bin"
    install -m 755 "civvm" "${pkgdir}/usr/bin"
    install -m 755 "civrun" "${pkgdir}/usr/bin"
    
    install -dm 755 "${pkgdir}/usr/include"
    install -m 644 "civic.h" "${pkgdir}/usr/include"
}
