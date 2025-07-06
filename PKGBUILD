# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.3.21
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('8e060e58a96b3e443b8b4d6097dff330cbdba002d44144143fa22be8a9ab3bf3')
sha256sums_aarch64=('80ef99e2732b993a7b36cee5d2f5596978dfdb200af1de672e9e39ed657105c9')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
