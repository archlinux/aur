# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.5.11
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('7dbfea0f857b79ec8d62bdc6606fb6b8532cb1f1e9fc2ca041f67d64fbd4ca5b')
sha256sums_aarch64=('7d02801c75478cdf5fe7595ee0523091603322075c21e71e3909181eb4613f8a')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
