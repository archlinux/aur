# Maintainer: George Oastler <goastler4 at gmail dot com>
pkgname=lanscan
pkgver=1.0.10
pkgrel=1
pkgdesc='LAN network scanner — discovers devices via ARP, optionally scans TCP/UDP ports'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
url='https://github.com/goastler/lanscan'
license=('AGPL-3.0-only')
source=("LICENSE::https://raw.githubusercontent.com/goastler/lanscan/refs/tags/v1.0.10/LICENSE")
source_x86_64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.10/lanscan-linux-x86_64")
source_i686=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.10/lanscan-linux-x86")
source_aarch64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.10/lanscan-linux-aarch64")
source_armv7h=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.10/lanscan-linux-armv7")
source_armv6h=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.10/lanscan-linux-armv6-hf")
source_riscv64=("lan::https://github.com/goastler/lanscan/releases/download/v1.0.10/lanscan-linux-riscv64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('7f07c44c6e07487e960fb32494c0e856ffbeac87851fb4b7198d75932f89c030')
sha256sums_i686=('4ed6c0d5b0d10cf07c6511104e4f1c5a7d99ea1d71e39d73c7b8a5d095ebe53e')
sha256sums_aarch64=('1bd434bb47cde127ca241f54e912a0d7a446975acb877c179dc68f0af9faa7ac')
sha256sums_armv7h=('61c68cf317930ecb6b58ff296dbc2d4935392143b3741d7d608f7611459ec975')
sha256sums_armv6h=('f870d233c2657eae9e06c82dd474ef0934502be5401ee70d8c8ef99b8bc52eaf')
sha256sums_riscv64=('e123382141b90aafdd3e960729693ffa7cdff64ebbcc59d40a0a3f26964dea76')

package() {
    install -Dm755 "${srcdir}/lan" "${pkgdir}/usr/bin/lan"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
