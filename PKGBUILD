# Maintainer: Nicolas Marot <nicolas dot marot at gmail dot com>
# Contributor: Shayne Hartford <shayneehartford at gmail dot com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=1.3.17.04
pkgrel=1
pkgdesc="The Raptoreum Wallet"
arch=("any")
url="https://github.com/Raptor3um/$_pkgname"
license=("MIT")
provides=("raptoreum")
_filename="raptoreum-ubuntu22-${pkgver}"
source=(
    "https://github.com/Raptor3um/raptoreum/releases/download/$pkgver/$_filename.tar.gz"
)
sha256sums=(
    "d7a22be72223a6f7df8b3ded0479c17471991eb51143b0ea083f23379f911621"
)

package() {
    install -d ${pkgdir}/usr/bin
    rm ${srcdir}/$_filename.tar.gz
    mv ${srcdir}/* ${pkgdir}/usr/bin
}
