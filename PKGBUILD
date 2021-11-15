# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=1.2.15.2
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
    "46f99826e2eac3069b439349e3a1d394895fe5e964f939f84a5b59965434b7dc6426a733b661df57516dbd5bd91b4dc9f33768880836ad28ddfb54f76db4a83b"
)

package() {
    install -d ${pkgdir}/usr/bin
    rm ${srcdir}/$_filename.tar.gz
    mv ${srcdir}/* ${pkgdir}/usr/bin
}
