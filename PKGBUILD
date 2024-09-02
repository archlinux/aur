# Maintainer: Nicolas Marot <nicolas dot marot at gmail dot com>
# Contributor: Shayne Hartford <shayneehartford at gmail dot com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=2.0.3.01
pkgrel=1
pkgdesc="The Raptoreum Wallet"
arch=("any")
url="https://github.com/Raptor3um/$_pkgname"
license=("MIT")
provides=("raptoreum")
_filename="raptoreum-ubuntu22-${pkgver}-mainnet-"
source=(
    "https://github.com/Raptor3um/raptoreum/releases/download/$pkgver-mainnet/$_filename.tar.gz"
)
sha256sums=(
    "1dfb7b127485b668eb9cbeecd585028075580aaa302d96dad89f9790741aeb60"
)

package() {
    install -d ${pkgdir}/usr/bin
    rm ${srcdir}/$_filename.tar.gz
    mv ${srcdir}/* ${pkgdir}/usr/bin
}
