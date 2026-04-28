# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0')
provides=('herdr')
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('3859c72682b5bb55b0e7c8cf19de3a8d202e97ee25355245fce236ee1f7ada41')
sha256sums_aarch64=('2e2f1c16e31f137af89443598c87734b1adf8c83a7c0bea96107f393db8f660e')

package() {
    install -Dm755 herdr-${pkgver}-${CARCH} "${pkgdir}/usr/bin/herdr"
}
