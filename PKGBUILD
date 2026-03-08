# Maintainer: arimxyer
pkgname=modelsdev-bin
pkgver=0.9.8
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
sha256sums_x86_64=('1315dfed3957bb510cf6205ed7de7010f75fc21367471920fea2ed750c9e65f0')
sha256sums_aarch64=('039fa60a08d26f2761d89abf887b208ab27f90297a6a975d91eb9e5f452e161a')

package() {
    install -Dm755 models "${pkgdir}/usr/bin/models"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
