# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=cencli-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Command line interface for interacting with Censys"
arch=('x86_64')
url="https://docs.censys.com/docs/platform-cli"
license=('Apache-2.0')
options=(!strip !debug)
source=("https://github.com/censys/cencli/releases/download/v${pkgver}/cencli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9fd5ece0142565f9c2730af55922e1855f63204b2618e80c45651c27c6646aad')

package() {
    install -Dm755 "${srcdir}/censys" "${pkgdir}/usr/bin/censys"
}

