# Maintainer: Patrick Li <aur@patrickli.one>
pkgname=unbill-cli-nightly-bin
pkgver=nightly.20260612.005924
pkgrel=1
pkgdesc="Command-line interface for unbill (nightly)"
arch=('x86_64')
url="https://github.com/unbill-project/unbill"
license=('MIT' 'Apache-2.0')
depends=('unbill-daemon-nightly')
provides=('unbill-cli')
conflicts=('unbill-cli' 'unbill-cli-bin')
_tag=nightly-20260612-005924
source_x86_64=("unbill-cli::https://github.com/unbill-project/unbill/releases/download/${_tag}/unbill-cli-linux-x86_64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/unbill-cli" "${pkgdir}/usr/bin/unbill-cli"
}
