# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=raptoreum-bin
_pkgname=raptoreum
pkgver=1.2.15.3
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
    "1a3aeeb6b46b634a6fc3fa13466b53fb180fe801043c5192bb1b157e083ed17ba9c20c27053e4ffb8f0345f485c3a0aa60aea145c8df35538c29ad15474f1f2f"
)

package() {
    install -d ${pkgdir}/usr/bin
    rm ${srcdir}/$_filename.tar.gz
    mv ${srcdir}/* ${pkgdir}/usr/bin
}
