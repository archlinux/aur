# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=cencli-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Command line interface for interacting with Censys"
arch=('x86_64')
url="https://docs.censys.com/docs/platform-cli"
license=('Apache-2.0')
options=(!strip !debug)
source=("https://github.com/censys/cencli/releases/download/v${pkgver}/cencli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7c2db5f6a1d571ed174f72e648fe9ad3789d99701ba2df5892e0fcf5768e37b4')

package() {
    install -Dm755 "${srcdir}/censys" "${pkgdir}/usr/bin/censys"
}

