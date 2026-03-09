# Maintainer: arimxyer
pkgname=modelsdev-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Browse AI models, benchmarks, and coding agents from the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/arimxyer/models'
license=('MIT')
provides=('modelsdev' 'models')
conflicts=('modelsdev' 'modelsdev-git')
source=("LICENSE::https://raw.githubusercontent.com/arimxyer/models/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/models-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/models-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('515175e700aadba7b5436688d6daa0e06ea17bfb657e377e14138f65866082a3')
sha256sums_x86_64=('27b7be7b01f01a1b474fcbcc62601941931c2cf4cc3b2d6f6cff267306dde7b5')
sha256sums_aarch64=('3f4bf773bec8e193fad8e2e5b429da8a0716ac9fde5c28d375fcd6bb1b89a260')

package() {
    install -Dm755 models "${pkgdir}/usr/bin/models"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
