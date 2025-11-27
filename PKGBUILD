# Maintainer: Plague Doctor <plague@privacyrequired.com>
pkgname=venice-cli-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Command-line interface for venice.ai - privacy-focused AI with interactive chat"
arch=('x86_64')
url="https://gitlab.com/Plague_Doctor/venice-cli"
license=('GPL3')
options=('!debug')  # Skip debug symbol processing for Go binaries
depends=()  # No runtime dependencies for static Go binary
provides=('venice-cli')
conflicts=('venice-cli')
source_x86_64=("https://gitlab.com/api/v4/projects/76426846/packages/generic/venice-cli/v${pkgver}/venice-linux-amd64")
sha256sums_x86_64=('958a91e291e2d9f7174dd76bea321451c6a9f27bc08da090ef3a93e0a105a6be')

package() {
    # Install binary
    install -Dm755 "${srcdir}/venice-linux-amd64" \
        "${pkgdir}/usr/bin/venice-cli"
}

