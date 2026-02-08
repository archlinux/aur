# Maintainer: Joel Grimberg
pkgname=timesheetz
pkgver=1.31.0
pkgrel=1
pkgdesc="Timesheet management with TUI and REST API"
arch=('x86_64' 'aarch64')
url="https://github.com/joelgrimberg/timesheetz"
license=('MIT')
depends=('glibc')
provides=('timesheetz')

source_x86_64=("${url}/releases/download/v${pkgver}/timesheetz_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/timesheetz_Linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 timesheet "${pkgdir}/usr/bin/timesheetz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
