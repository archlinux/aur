# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=cencli-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="Command line interface for interacting with Censys"
arch=('x86_64')
url="https://docs.censys.com/docs/platform-cli"
license=('Apache-2.0')
options=(!strip !debug)
source=("https://github.com/censys/cencli/releases/download/v${pkgver}/cencli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('1fe7136413e0e0d140c58812cb17f3279c0b55f2ea062763be7988fe15872816')

package() {
    install -Dm755 "${srcdir}/censys" "${pkgdir}/usr/bin/censys"
}

