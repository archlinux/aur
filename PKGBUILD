# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('0b4930bc743af2fe2869976b2126eeeca74d66d9cb406430e48089873a5f9578')
sha256sums_aarch64=('867aa7f0dbe8ed9a6cc31680b6187deb3fb9df1c8293c27cb58072c9d67a0a01')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
