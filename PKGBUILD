# Maintainer: liangshengfeng <your.email@example.com>
pkgname=ccnexus-bin
pkgver=5.2.0
pkgrel=2
pkgdesc='ccNexus - A network tool for proxy testing and management'
arch=('x86_64')
url='https://github.com/lich0821/ccNexus'
license=('unknown')
depends=()
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::https://github.com/lich0821/ccNexus/releases/download/v${pkgver}/ccNexus-v${pkgver}-linux-amd64.tar.gz"
            "ccnexus.desktop")
sha256sums_x86_64=('da9e30d93abf34d22b5773d8869b53cdff2aafe4b6bf4501f256123ffcf3afd7'
                    'SKIP')

package() {
    # Install binary
    install -Dm755 "ccNexus" "${pkgdir}/usr/bin/ccnexus"

    # Install desktop file
    install -Dm644 "ccnexus.desktop" "${pkgdir}/usr/share/applications/ccnexus.desktop"
}
