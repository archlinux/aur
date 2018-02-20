# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=0.15
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://github.com/G-Node/gin-cli'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('0f9f8b488366ee203d271d3ba95aa58f175b30c615ac078117ff92949301d1ee9e4f4439032c376ea77a25932dd41db588c9643e87cf45505cab4b598417c963')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
