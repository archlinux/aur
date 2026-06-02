# Maintainer: George Oastler <goastler4 at gmail dot com>
pkgname=lanscan
pkgver=1.0.7
pkgrel=1
pkgdesc='LAN network scanner — discovers devices via ARP, optionally scans TCP/UDP ports'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/goastler/lan-scan'
license=('AGPL-3.0-only')
source=("LICENSE::https://raw.githubusercontent.com/goastler/lan-scan/refs/tags/v1.0.7/LICENSE")
source_x86_64=("lan::https://github.com/goastler/lan-scan/releases/download/v1.0.7/lanscan-linux-x86_64")
source_aarch64=("lan::https://github.com/goastler/lan-scan/releases/download/v1.0.7/lanscan-linux-aarch64")
source_armv7h=("lan::https://github.com/goastler/lan-scan/releases/download/v1.0.7/lanscan-linux-armv7")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('85f139b96460c3b01d3b067d09f8e55c336e0304098625e195abfe95651da188')
sha256sums_aarch64=('a17ea1810481ed08c8079eaa7db1b68143c9565d30c681725f6c11d837328491')
sha256sums_armv7h=('50ebca7a29204e61b860112437e0657bd8240470f401316a9b5cd2480c12e599')

package() {
    install -Dm755 "${srcdir}/lan" "${pkgdir}/usr/bin/lan"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
