# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.3.22
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('6eb96e9204bd2cf0b133324fc106b788ba729436e50afb91041dceb04fdee840')
sha256sums_aarch64=('63eae981917b60b05f9caa9ab1cc98aab99ef40c6c0ba6ebf38ca6f71c60f028')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
