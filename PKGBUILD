# Maintainer: George Oastler <goastler4 at gmail dot com>
pkgname=lanscan
pkgver=1.0.12
pkgrel=1
pkgdesc='LAN network scanner — discovers devices via ARP, optionally scans TCP/UDP ports'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/goastler/lanscan'
license=('AGPL-3.0-only')
source=("LICENSE::https://raw.githubusercontent.com/goastler/lanscan/refs/tags/v1.0.12/LICENSE")
source_x86_64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.12/lanscan-linux-x86_64")
source_i686=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.12/lanscan-linux-x86")
source_aarch64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.12/lanscan-linux-aarch64")
source_armv7h=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.12/lanscan-linux-armv7")
source_armv6h=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.12/lanscan-linux-armv6-hf")
source_riscv64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.12/lanscan-linux-riscv64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('2b494defe995a5e4ac4e61c96ee347e02e2c71505056f33e943bcbf1c4483d06')
sha256sums_i686=('ac2de3883e09dabf2b7d4fe062fbe4532a3973ea03c573d669e8dfe1fa1f4129')
sha256sums_aarch64=('9e7a5d08640e75dc5b27768f729bcc0705e5fdae2da229091b7cc5e6d6c16588')
sha256sums_armv7h=('db45568150b3a94e6b5a6262e714afa15581741f68a3d65d427bb2577f22f263')
sha256sums_armv6h=('ef64926bc7f68f4969a9e084203ade798d9cec0fb6e1fe8b4e44320b8f4179f5')
sha256sums_riscv64=('913f7aa8208eb91289448b2c54ab7ce5388f4748f7d023c84b60c90b33e60ed6')

package() {
    install -Dm755 "${srcdir}/lan" "${pkgdir}/usr/bin/lan"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
