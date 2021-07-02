# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=v1.0.0_beta4
pkgrel=1

pkgdesc="Lightweight, native cross-platform implementation of cqhttp in Golang."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/Mrs4s/go-cqhttp/releases"
license=("AGPL3")

optdepends=("ffmpeg: support voice sending in any format")

source_i686=("${pkgname}-i686-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_386.tar.gz")
sha512sums_i686=('63e9e0ebfba0dbb935821741d8b241d15dd5c40ba2ebf3a6dcf87bf7568bf07e5caeed1dfbde3adc2ce751fb32e856deda911dceb01dbed49e0d2bbd1f2781c3')
source_x86_64=("${pkgname}-x86_64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_amd64.tar.gz")
sha512sums_x86_64=('7c69cca528b84a170e5a83e096a478a22623d99586a640355e58307cf254686436dcb2e2fbd2d5fab87d1d1359acd97123b78d77bd3b853c59577f4b1c594f6c')
source_armv7h=("${pkgname}-armv7h-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_armv7.tar.gz")
sha512sums_armv7h=('5d0d7fd8a6b7b4cd98b9b5e7a8842e6a5f8b063388cca3b06d0c983d8cf1db075ea27a0d65c8b6e5349ef507e906c636334e024f9654ea0ea596faa230506a5f')
source_aarch64=("${pkgname}-aarch64-${pkgver//_/-}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${pkgver//_/-}/go-cqhttp_linux_arm64.tar.gz")
sha512sums_aarch64=('45a565cfa66019a7dccc7d787709f1e4be6bfe07a4a8ef1e778bc4f663d7b99372a0bc04e4d3f5604e58a4a583ed0f421ed88de6579528b23d7af6047b1b9e46')


package() {
    cd ${srcdir}
    install -Dm755 "go-cqhttp" "${pkgdir}/usr/bin/go-cqhttp"
}
