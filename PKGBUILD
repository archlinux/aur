# Maintainer: George Oastler <goastler4 at gmail dot com>
pkgname=lanscan
pkgver=1.0.9
pkgrel=1
pkgdesc='LAN network scanner — discovers devices via ARP, optionally scans TCP/UDP ports'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/goastler/lanscan'
license=('AGPL-3.0-only')
source=("LICENSE::https://raw.githubusercontent.com/goastler/lanscan/refs/tags/v1.0.9/LICENSE")
source_x86_64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.9/lanscan-linux-x86_64")
source_i686=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.9/lanscan-linux-x86")
source_aarch64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.9/lanscan-linux-aarch64")
source_armv7h=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.9/lanscan-linux-armv7")
source_armv6h=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.9/lanscan-linux-armv6-hf")
source_riscv64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.9/lanscan-linux-riscv64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('f87950550fd3b5d2a7cb59b8f8d3dc907f2b97a37db9479d1e2afc1ec702e094')
sha256sums_i686=('1403d570e4d6ca42730d2a65383723b542ece00aa734e8d5294010bbe559b109')
sha256sums_aarch64=('aab688a952f392d08d74b310395762b259823acc651a75fb8d3817625e6111a0')
sha256sums_armv7h=('d7a7d2c7e5b7eee0ef8f58fe38c30c4d8d750ae2c86a3707c29cfa4ec765b5c7')
sha256sums_armv6h=('a48a21667222e096dffbc29278ea43788de1eaab2b8e082224c24990f0830a1e')
sha256sums_riscv64=('9e87ff6d2cf3c61ec3a80a5a8471a2117e220880b18d2b7195706f4889aac580')

package() {
    install -Dm755 "${srcdir}/lan" "${pkgdir}/usr/bin/lan"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
