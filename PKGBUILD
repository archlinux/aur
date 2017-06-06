# Maintainer: Crotok <crotok [at] mailbox [dot] org>

_pkgbase=sia
pkgname=sia-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=("x86_64")
conflicts=("${_pkgbase}" "siad")
url="http://sia.tech/"
license=('MIT')
provides=("siad=${pkgver}" "siac=${pkgver}")
source=("https://github.com/NebulousLabs/Sia/releases/download/v${pkgver}/Sia-v${pkgver}-linux-amd64.zip")

sha256sums=("b11e4535510b3affe0820059226507d68463ddc8cf2c5f59fbe2ff9f8931055c")

package() {
    # Binary file
    install -Dm755 "${srcdir}/Sia-v${pkgver}-linux-amd64/siac" "${pkgdir}/usr/bin/siac"
    install -Dm755 "${srcdir}/Sia-v${pkgver}-linux-amd64/siad" "${pkgdir}/usr/bin/siad"
}
