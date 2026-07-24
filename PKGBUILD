# Maintainer: Yrozxm <aiiiilobinbutter@gmail.com>
pkgname=yroz-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Universal software manager for Linux (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Yrozxm/Yroz-cli"
license=('MIT')
depends=('curl')
provides=('yroz')
conflicts=('yroz')
source_x86_64=("https://github.com/Yrozxm/Yroz-cli/releases/download/v${pkgver}/yroz-x86_64")
source_aarch64=("https://github.com/Yrozxm/Yroz-cli/releases/download/v${pkgver}/yroz-aarch64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/yroz-${CARCH}" "${pkgdir}/usr/bin/yroz"
}
