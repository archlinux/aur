# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=0.16
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('42254d17cd66857b1c9b576091197ffc957682e202cc3fd3d5e3f82c83275cf49b7e2036f0b6317e383ca61254cf10d730767a2996709741b5e1e5b5372a7b99')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
