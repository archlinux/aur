# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=0.13
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://github.com/G-Node/gin-cli'
license=('BSD')
depends=('git-annex')
install=${pkgname}.install
sha512sums=('354a6c929f1ac042e1d16d90b87208cc8bcc24df24882c1c9a72ba3ac4e49db19e842112badd20eed2c2b047893546ddd54029222e235f6027661e06bcad82ee')
            source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
