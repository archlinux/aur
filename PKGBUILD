# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.22
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('2af51d88642eedb1ef012318a3d136c468988470354593fd57779ff074b2317d')
sha256sums_aarch64=('68ead1ed0c7f723fce9152acc407264c8fd856ce617355af076837044fb7b993')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
