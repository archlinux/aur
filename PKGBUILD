# Maintainer: Abid Omar <contact@omarabid.com>
pkgname=codeinput-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A powerful CLI tool for parsing, analyzing, and managing CODEOWNERS files"
arch=('x86_64' 'aarch64')
url="https://codeinput.com/cli"
license=('MIT')
provides=('codeinput')
conflicts=('codeinput')
options=('!strip')
source_x86_64=("https://github.com/code-input/cli/releases/download/v${pkgver}/ci-linux-x86_64")
source_aarch64=("https://github.com/code-input/cli/releases/download/v${pkgver}/ci-linux-aarch64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/ci-linux-${CARCH}" "${pkgdir}/usr/bin/ci"
}
