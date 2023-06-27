# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.1.0
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

sha256sums_i686=('2c801a1facabd0687280ee324496f0b42f8da6ecc0937a9bee5cef5d2b07c105')
sha256sums_x86_64=('29483e687c368cc14727faf50e9c785ef27bcdfce5ae005d5c78ad216b00ffc1')
sha256sums_armv7h=('6597e3498a881491383f80c1d58536a57612381695557c58c21e2d4589fb3811')
sha256sums_aarch64=('537a3a28deef985cbc6ce3ba6519a1219e7a909f4bbc42e86355c99d8b054c25')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
