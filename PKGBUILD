# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-client-bin
pkgver=0.3.21
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (GUI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('1f0ebe311a9256e2fd73136810498c31299737d387bd0dbf6984a5958dfd0edc')
sha256sums_aarch64=('d3b8b1ef7b3f00759f39be164a221e6fd33ddbe3bbd99694050462fea0430f92')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
