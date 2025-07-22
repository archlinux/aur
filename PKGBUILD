# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.3.22
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('e1af0696a87b649334e1e63b31c3b0516e45cadd5822758e76224481856643f0')
sha256sums_aarch64=('46c2ac91e6f8fe86047470c60a8b32f09b45b99b7441cfa416758a39b831c976')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
