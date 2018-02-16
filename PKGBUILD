# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=0.14
pkgrel=2
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://github.com/G-Node/gin-cli'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('3ef3ae78ab9bfc0c22720497e042b1b3da05805c435c6d4acb5ec7d7687cae6e56881a12766b1b884a02c43e0316524dc7870fa029d75cacb57a8e420ddec16e')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
