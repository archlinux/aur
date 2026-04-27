# Maintainer: sakkkurai <zenpawlabs@protonmail.com>
pkgname=skypaw-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Weather in your terminal with beautiful Bubble Tea UI"
arch=('x86_64' 'aarch64')
url="https://github.com/sakkkurai/skypaw"
license=('MIT')
provides=('skypaw')
conflicts=('skypaw')

source_x86_64=("skypaw::${url}/releases/download/v${pkgver}/skypaw_linux_amd64")
source_aarch64=("skypaw::${url}/releases/download/v${pkgver}/skypaw_linux_arm64")

sha256sums_x86_64=('6ceee305ab4692640af36f998b973c92499d99c7164f67433688376c7abe739a')
sha256sums_aarch64=('62e3b6d17b00a18b61e9e162dc0ca7f8b174e2900ea56c34e589459cfa92758e')

package() {
    install -Dm755 "${srcdir}/skypaw" "${pkgdir}/usr/bin/skypaw"
}
