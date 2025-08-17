# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.23
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('33701f976022d0ec904a662a659ce9e08696cbf466950bc4603a318370df79c7')
sha256sums_aarch64=('7628d673b7bc0cd6749bd15be35bb9b0b6dc438918e7f411d4acf32012cb8407')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
