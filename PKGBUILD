# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.2.0
pkgrel=2

pkgdesc='Lightweight, native cross-platform implementation of cqhttp in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Mrs4s/go-cqhttp/releases'
license=('AGPL-3.0-only')
install=go-cqhttp-bin.install

optdepends=('ffmpeg: support voice sending in any format')

provides=('go-cqhttp')

_origin_pkgver="v${pkgver//_/-}"

source_i686=("${pkgname}-i686-${_origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${_origin_pkgver}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${_origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${_origin_pkgver}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${_origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${_origin_pkgver}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${_origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${_origin_pkgver}/go-cqhttp_linux_arm64.tar.gz")

sha256sums_i686=('492f12a6bb5c5d81241193a4bdc649ca2aafc1380c43f0482652f52c2cd4d835')
sha256sums_x86_64=('64bf7b1d5e6456bfad43db8e5dd455d12679ed37ea0e91106b50cd7900050de2')
sha256sums_armv7h=('e48a56a9a0d94729decd6d3ba37ccfe82de6e5c9ea29a791c7e51005b7d7a34a')
sha256sums_aarch64=('cc7fad4a1ab177a771752bd5f27df91e6a28fb899b339d6725d7477c70000046')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
