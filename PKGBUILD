# Maintainer: Fptn Team <fptnvpn at gmail dot com>
pkgname=fptn-client-cli-bin
pkgver=0.3.21
pkgrel=1
pkgdesc='Non-commercial VPN, a volunteer project for bypassing censorship (CLI client)'
arch=('x86_64' 'aarch64')
url='https://github.com/batchar2/fptn'
license=('MIT')
source_x86_64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/fptn-client-cli-${pkgver}-ubuntu22.04-arm64.deb")
sha256sums_x86_64=('494f9580539746a241397577a48310b2e872d8b6653892b7c6b573b398ec62b7')
sha256sums_aarch64=('cbd026f4d67c4bbbb88853d03740364db786e9d1497cd3904e980020a185eb9e')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst -C "${pkgdir}"
}
