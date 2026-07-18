# Maintainer: Szymon Porwolik <szporwolik@users.noreply.github.com>
pkgname=cqops-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Fast, minimal Go TUI ham radio logger"
arch=('x86_64')
url="https://github.com/szporwolik/cqops"
license=('Apache-2.0')
provides=('cqops')
conflicts=('cqops')
source=("cqops-${pkgver}-amd64.tar.gz::https://github.com/szporwolik/cqops/releases/download/v${pkgver}/cqops-linux-amd64.tar.gz")
sha256sums=('SKIP')
package() {
    install -Dm755 cqops-linux-amd64 "${pkgdir}/usr/bin/cqops"
}
