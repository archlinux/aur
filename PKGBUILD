# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=cencli-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Command line interface for interacting with Censys"
arch=('x86_64')
url="https://docs.censys.com/docs/platform-cli"
license=('Apache-2.0')
options=(!strip !debug)
source=("https://github.com/censys/cencli/releases/download/v${pkgver}/cencli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('61d4c019440e37d99d425484c0ae57d85f6234d93fef904a3f174238dffe7291')

package() {
    install -Dm755 "${srcdir}/censys" "${pkgdir}/usr/bin/censys"
}

