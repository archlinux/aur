# Maintainer: Crotok <crotok [at] mailbox [dot] org>

_pkgbase=shub
pkgname=shub-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Scrapinghub Command Line Client"
arch=("x86_64")
conflicts=("${_pkgbase}")
url="https://scrapinghub.com/"
license=("BSD")
provides=("shub=${pkgver}")

source=("https://github.com/scrapinghub/shub/releases/download/v2.5.1/shub-v${pkgver}-linux-x64.tar.gz")

sha256sums=("5e449fa2378f6f32b047aac2efd981d462440b70e762fa3eceff0a28347a3842")

package() {
    # Binary file
    install -Dm755 "${srcdir}/shub" "${pkgdir}/usr/bin/shub"
}
