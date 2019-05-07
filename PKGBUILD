# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.7
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('abb03f533e32bca956d07513b8d5eef5831bca85622a5bcfc26bd8b81aa5a6bab7ac60bddef7a959cc07055f9020ab1996b30c6a78bcc67364cf688ffc8e7c30')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
