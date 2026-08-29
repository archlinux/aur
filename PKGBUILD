# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=cencli-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Command line interface for interacting with Censys"
arch=('x86_64')
url="https://docs.censys.com/docs/platform-cli"
license=('Apache-2.0')
options=(!strip !debug)
source=("https://github.com/censys/cencli/releases/download/v${pkgver}/cencli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('e61086ed61ceb19401e8165c59a2d99bc4eb89975ab46a0d352afeaf4ca10805')

package() {
    install -Dm755 "${srcdir}/censys" "${pkgdir}/usr/bin/censys"
}

