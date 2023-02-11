# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.0.0_rc4
pkgrel=1

pkgdesc='Lightweight, native cross-platform implementation of cqhttp in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Mrs4s/go-cqhttp/releases'
license=('AGPL3')
install=go-cqhttp-bin.install

optdepends=('ffmpeg: support voice sending in any format')

provides=('go-cqhttp')

origin_pkgver="v${pkgver//_/-}"

source_i686=("${pkgname}-i686-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_arm64.tar.gz")

sha256sums_i686=('a1ade4380ed4cf60e66efc0ed7c81b4e475df403ed95619af316754550735255')
sha256sums_x86_64=('a2d0a75eca81689d3666f6857300def03888ad1faac11beac59464e89920b1bc')
sha256sums_armv7h=('e61f5e3c5923a7324f5bb851cb55a881b7ba718b139174e1375005bb511bf2d3')
sha256sums_aarch64=('1e2780f7f0188ff0872504d154bcd5f635539e164ab95f561f66b7b5ecbf08e9')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
