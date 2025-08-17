# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-server-bin
pkgver=0.3.23
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (server)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-server-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('a0e92a16b69a407eb0f8ac46e3d52bda0bbb4b69a5e26d6cfa87e255b9a47c59')
sha256sums_aarch64=('4ff1e97a7c92d59fc100f45175b1a52c1685f159ae45880555f4bcc85d977a21')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
