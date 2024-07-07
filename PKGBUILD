# Maintainer: Nicolas Marot <nicolas dot marot at gmail dot com>
# Contributor: Shayne Hartford <shayneehartford at gmail dot com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=1.3.17.06
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
    "09f35431cb821cfe054781394ce5c8bf959eb1b776f69f48e68f7a5b9e27c99a"
)

package() {
    install -d ${pkgdir}/usr/bin
    rm ${srcdir}/$_filename.tar.gz
    mv ${srcdir}/* ${pkgdir}/usr/bin
}
