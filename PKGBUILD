# Maintainer: Szymon Porwolik <szporwolik@users.noreply.github.com>
pkgname=cqops-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast, offline-first amateur radio logger for the terminal"
arch=('x86_64')
url="https://github.com/szporwolik/cqops"
license=('Apache-2.0')
provides=('cqops')
conflicts=('cqops')
source=("cqops-${pkgver}-amd64.tar.gz::https://github.com/szporwolik/cqops/releases/download/v0.10.0/cqops-linux-amd64.tar.gz"
        "cqops.svg::https://raw.githubusercontent.com/szporwolik/cqops/v0.10.0/assets/cqops-icon.svg"
        "cqops.desktop::https://raw.githubusercontent.com/szporwolik/cqops/v0.10.0/installer/cqops.desktop")
sha256sums=('972d7bc25afd4188523b7d009999d50111810302ef8e52886181cee51500634e'
            'b7f11342cb2edd20f1b656c7eba182cd477ea136c7c96bde66bb58d1d173d1c6'
            '68b29d2df1abd1e3fb673e9f3a32e0441bd3a8eb79e008ff17a7e09f0f3c6339')
package() {
    install -Dm755 cqops-linux-amd64 "${pkgdir}/usr/bin/cqops"
    install -Dm644 cqops.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cqops.svg"
    install -Dm644 cqops.desktop "${pkgdir}/usr/share/applications/cqops.desktop"
}
