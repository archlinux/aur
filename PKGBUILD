# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=1.3.15.99
pkgrel=1
pkgdesc="The Raptoreum Wallet"
arch=("any")
url="https://github.com/Raptor3um/$_pkgname"
license=("MIT")
provides=("raptoreum")
_filename="raptoreum_${pkgver}_ubuntu20_64"
source=(
    "https://github.com/Raptor3um/raptoreum/releases/download/$pkgver/$_filename.tar.gz"
)
sha512sums=(
    "eff203af40a3b3079748fcb40c44e00cedded6d10670e23bd9a7bf7355e903e5329409fe8267d1d9e1d0796874f36b3cd6a7deec4cf230e722ef772c471a86bd"
)

package() {
    install -d ${pkgdir}/usr/bin
    mv ${srcdir}/${_filename}/* ${pkgdir}/usr/bin
}
