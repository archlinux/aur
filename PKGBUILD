# Maintainer: pxlvre.eth <https://github.com/pxlvre>
pkgname=heidr
pkgver=0.0.5
pkgrel=1
pkgdesc="EVM blockchain CLI tool"
arch=('x86_64')
url="https://github.com/pxlvre/heidr"
license=('AGPL-3.0-or-later')
provides=('heidr')
conflicts=('heidr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pxlvre/heidr/releases/download/v${pkgver}/heidr-linux-amd64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/heidr" "${pkgdir}/usr/bin/heidr"
}
