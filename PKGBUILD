# Maintainer: Patrick Li <aur@patrickli.one>
pkgname=unbill-cli-bin
pkgver=0
pkgrel=1
pkgdesc="Command-line interface for unbill"
arch=('x86_64')
url="https://github.com/patrickli/unbill"
license=('MIT' 'Apache-2.0')
provides=('unbill-cli')
conflicts=('unbill-cli')
source_x86_64=("unbill-cli::https://github.com/patrickli/unbill/releases/download/${pkgver}/unbill-cli-linux-x86_64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/unbill-cli" "${pkgdir}/usr/bin/unbill-cli"
}
