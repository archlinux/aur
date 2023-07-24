# Maintainer: Nicolas Marot <nicolas dot marot at gmail dot com>
# Contributor: Shayne Hartford <shayneehartford at gmail dot com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=1.3.17.05
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
    "57903e094650773524064956d12a14c44f820f97f456bd9a9a98107b6219aa11"
)

package() {
    install -d ${pkgdir}/usr/bin
    rm ${srcdir}/$_filename.tar.gz
    mv ${srcdir}/* ${pkgdir}/usr/bin
}
